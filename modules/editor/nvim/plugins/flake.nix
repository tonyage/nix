{
  inputs = {
    nvim-better-digraphs-src = {
      url = "github:protex/better-digraphs.nvim";
      flake = false;
    };
    nvim-headlines-src = {
      url = "github:lukas-reineke/headlines.nvim";
      flake = false;
    };
    nvim-lspsaga-src = {
      url = "github:glepnir/lspsaga.nvim";
      flake = false;
    };
    nvim-regexplainer-src = {
      url = "github:bennypowers/nvim-regexplainer";
      flake = false;
    };
  };
  outputs = inputs:
    let
      missingVimPluginsInNixpkgs = pkgs: {
        nvim-better-digraphs = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-better-digraphs";
          src = inputs.nvim-better-digraphs-src;
        };
        nvim-headlines = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-headlines";
          src = inputs.nvim-headlines-src;
        };
        nvim-lspsaga = pkgs.vimUtils.buildVimPluginFrom2Nix {
          name = "nvim-lspsaga";
          src = inputs.nvim-lspsaga-src;
        };
        nvim-regexplainer = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-regexplainer";
          src = inputs.nvim-regexplainer-src;
        };
      };
    in {
      overlay = _final: prev: {
        vimPlugins = prev.vimPlugins // (missingVimPluginsInNixpkgs prev.pkgs);
      };
    };
}
