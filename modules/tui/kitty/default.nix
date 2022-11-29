{ colorscheme, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font";
      font_size = 10;
      shell = "zsh";
      scrollback_lines = 100000;

      foreground = "${colorscheme.white}";
      background = "${colorscheme.black}";

      color0 = "${colorscheme.black}";
      color1 = "${colorscheme.bright-red}";
      color2 = "${colorscheme.bright-green}";
      color3 = "${colorscheme.bright-yellow}";
      color4 = "${colorscheme.bright-blue}";
      color5 = "${colorscheme.bright-magenta}";
      color6 = "${colorscheme.bright-cyan}";
      color7 = "${colorscheme.bright-white}";

      color8 = "${colorscheme.bright-black}";
      color9 = "${colorscheme.red}";
      color10 = "${colorscheme.green}";
      color11 = "${colorscheme.yellow}";
      color12 = "${colorscheme.blue}";
      color13 = "${colorscheme.magenta}";
      color14 = "${colorscheme.cyan}";
      color15 = "${colorscheme.white}";
    };
  };
}
