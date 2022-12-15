{ pkgs, ... }: {

  services.nix-daemon = {
    enable = true;
    package = pkgs.nixFlakes;
  };

  nix.extraOptions = ''
    extra-platforms = aarch64-darwin x86_64-darwin
    experimental-features = nix-command flakes
  '';

  programs.zsh.enable = true;
  system.keyboard.enableKeyMapping = true;
}
