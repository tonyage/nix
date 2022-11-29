{
  programs.exa.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  imports = [ ./alacritty ./bat ./git ./zellij ./zsh ];
}
