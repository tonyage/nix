{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      copilot-vim

      alpha-nvim
      indent-blankline-nvim
      nvim-colorizer-lua

      gitsigns-nvim

      nvim-tree-lua
      cheatsheet-nvim

      nvim-autopairs
      comment-nvim
      nvim-surround
      nvim-lspconfig
      todo-comments-nvim

      telescope-nvim
      telescope-fzf-native-nvim

      nui-nvim
      plenary-nvim
      popup-nvim
      project-nvim
      nvim-web-devicons

      friendly-snippets
      nvim-cmp
      luasnip
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-calc
      cmp-path

      nvim-dap
      nvim-dap-python
      nvim-dap-ui

      fidget-nvim
      null-ls-nvim
      rust-tools-nvim
      crates-nvim

      (nvim-treesitter.withPlugins (plugins: with plugins; [
        tree-sitter-bash
        tree-sitter-c
        tree-sitter-cpp
        tree-sitter-cmake
        tree-sitter-css
        tree-sitter-dockerfile
        tree-sitter-html
        tree-sitter-java
        tree-sitter-kotlin
        tree-sitter-latex
        tree-sitter-lua
        tree-sitter-markdown
        tree-sitter-markdown-inline
        tree-sitter-nix
        tree-sitter-python
        tree-sitter-regex
        tree-sitter-ruby
        tree-sitter-rust
        tree-sitter-toml
        tree-sitter-typescript
        tree-sitter-yaml
      ]))

      nvim-treesitter-refactor
      nvim-treesitter-textobjects

      which-key-nvim
    ];

    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      shellcheck

      nodePackages.dockerfile-language-server-nodejs
      hadolint

      sumneko-lua-language-server
      luaformatter

      gitlint

      deadnix
      statix
      nil

      cmake-language-server

      python3Packages.isort
      nodePackages.pyright
      black

      rust-analyzer
      rustfmt
      clippy

      nodePackages.yaml-language-server
      yamllint
    ];

    extraConfig = ''
      luafile ${builtins.toString ./init.lua}
    '';

  };

  home.packages = with pkgs; [ nodePackages.livedown ];

  xdg.configFile = {
    "nvim/lua" = {
      source = ./lua;
      recursive = true;
    };
    "nvim/init.lua".source = ./init.lua;
  };
}
