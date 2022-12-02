{ pkgs, config, ... }:
let
  rofi = "${config.programs.rofi.finalPackage}/bin/rofi";
  sway = config.wayland.windowManager.sway.package;
  swaylock = pkgs.swaylock;
in {
  home.packages = (with pkgs; [
    grim
    waypipe
    swaylock
    pavucontrol
    sway-contrib.grimshot
  ]) ++ (with pkgs.libsForQt5; [
    ark
    dolphin
    okular
    dolphin-plugins
    kio
    kio-extras
  ]);

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    systemdIntegration = true;

    config = {
      terminal = "alacritty";
      menu = "wofi --show run";
      bars = [ 
        { fonts.size = 15.0; position = "top"; }
      ];
      startup = [
        { command = "chromium"; }
        { command = "thunderbird"; }
      ];
    };
  };

  systemd.user.services.mako = {
    Unit = {
      Description = "Notification daemon for Wayland";
      Documentatio = "man:mako(1)";
      After = "graphical-session-pre.target";
      PartOf = "sway-session.target"; # Should be terminated when the session ends.
    };
    Service = {
      Slice = "session.slice";
      BusName = "org.freedesktop.Notifications";
      ExecStart = "${pkgs.mako}/bin/mako";
      Restart = "always";
    };
    Install.WantedBy = [ "sway-session.target" ];
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "alacritty";
    extraConfig = {
      modi = "drun,run,ssh";
    };
  };

  services.udiskie = {
    enable = true;
    automount = false;
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 900;
        command = "${swaylock}/bin/swaylock";
      }
      {
        timeout = 905;
        command = ''${sway}/bin/swaymsg "output * power off"'';
        resumeCommand = ''${sway}/bin/swaymsg "output * power on"'';
      }
    ];
    events = [
      {
        event = "lock";
        command = "${swaylock}/bin/swaylock";
      }
      {
        event = "before-sleep";
        command = "/run/current-system/systemd/bin/loginctl lock-session";
      }
    ];
  };
  systemd.user.services.swayidle.Service.Slice = "session.slice";
  systemd.user.targets.sway-session.Unit.Wants = [ "xdg-desktop-autostart-target" ];
}
