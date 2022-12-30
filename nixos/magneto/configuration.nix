{ pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];

  users.users.build = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "no";
  };
}

