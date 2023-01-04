{ pkgs, ... }:
{
  programs.exa.enable = true;
  programs.direnv.nix-direnv.enable = true;
  imports = [ ./alacritty ./bat ./git ./kitty ./ssh ./zellij ./zsh ];

  home.packages = with pkgs; [
    ripgrep
    fd
    coreutils
  ];
}
