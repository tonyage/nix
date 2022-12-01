{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "alacritty";
      menu = "wofi --show run";
      bars = [ 
        { fonts.size = 15.0; position = "top"; }
      ];
      startup = [
        { command = "chromium"; }
      ];
    };
  };
}
