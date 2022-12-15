{ colorscheme, lib, pkgs, ... }:
let
  main = ./p10k/.p10k.zsh;
  tty = ./p10k/.p10k.tty.zsh;
in
{

  home.packages = with pkgs; [ zoxide fzf ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    shellAliases = import ./aliases.nix;

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    initExtraBeforeCompInit = ''
      P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=${colorscheme.grey90}'
      ${builtins.readFile ./docker.zsh} 
      ${builtins.readFile ./utils.zsh} 
      eval $(zoxide init zsh)
      eval $(zellji setup --generate-auto-start zsh)
    '';

    initExtra = ''
      if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
        [[ ! -f ${main} ]] || source ${main}
      else
        [[ ! -f ${tty} ]] || source ${tty}
      fi
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "adb" "colored-man-pages" "fzf" "gradle" "ripgrep" "rust" "web-search" "zoxide" ];
    };

    plugins = [
      { name = "powerlevel10k"; src = pkgs.zsh-powerlevel10k; file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }
      { name = "powerlevel10k-config"; src = lib.cleanSource ./p10k; file = "p10k.zsh"; }
    ];
  };
}
