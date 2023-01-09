{
  programs.git = {
    enable = true;
    includes = [
      { path = "~/git/personal/.gitconfig";  condition = "gitdir:~/git/personal/";  }
      { path = "~/git/work/.gitconfig"; condition = "gitdir:~/git/work/"; }
    ];

    userName = "Tony Do";
    userEmail = "tonyttdo@gmail.com";

    delta = {
      enable = true;
      options = {
        features = "line-numbers decorations";
        decorations = {
          commit-decoraction-style = "blue ol";
          commit-style = "raw";
        };
        syntax-theme = "TwoDark";
      };
    };

    extraConfig = {
      pull.ff = "only";
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
