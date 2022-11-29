{ colorscheme, ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "onedarkish";
      themes.onedarkish = { 
        fg = colorscheme.white;
        bg = colorscheme.black;

        inherit (colorscheme) black;
        inherit (colorscheme) red;
        inherit (colorscheme) green;
        inherit (colorscheme) yellow;
        inherit (colorscheme) blue;
        inherit (colorscheme) magenta;
        inherit (colorscheme) cyan;
        inherit (colorscheme) white;
        inherit (colorscheme) orange;
      };
    };
  };
}
