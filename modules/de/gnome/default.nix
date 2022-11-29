{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = { 
      name = "colloid-gtk-theme";
      package = pkgs.colloid-gtk-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true; 
    };
  };
}
