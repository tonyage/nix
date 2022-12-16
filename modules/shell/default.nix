{ pkgs, ... }:
{
  programs.exa.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  imports = [ ./alacritty ./bat ./git ./ssh ./zellij ./zsh ];

  home.packages = with pkgs; [
    ripgrep
    fd
    coreutils
  ];
}
