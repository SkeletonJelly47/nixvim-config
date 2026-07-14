{...}: {
  # You may browse available options for nvf on the online manual. Please see
  # <https://notashelf.github.io/nvf/options.html>
  vim = {
    lsp = {
      # Enable LSP functionality globally. This is required for modules found
      # in `vim.languages` to enable relevant LSPs.
      enable = true;
      formatOnSave = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      trouble.enable = true;

      # You may define your own LSP configurations using `vim.lsp.servers` in
      # nvf without ever needing lspconfig to do it. This will use the native
      # API provided by Neovim > 0.11
      servers = {};
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    # Language support and automatic configuration of companion plugins.
    # Note that enabling, e.g., languages.<lang>.diagnostics will automatically
    # enable top-level options such as enableLSP or enableExtraDiagnostics as
    # they are needed.
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;
      zig.enable = true;
      rust = {
        enable = true;
        extensions.crates-nvim.enable = true;
      };
    };

    opts = {
      tabstop = 2;
      shiftwidth = 2;
      wrap = false;
      scrolloff = 10;
      sidescrolloff = 5;
      list = true;
      listchars = {
        trail = "°";
      };
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      blink-indent.enable = true;

      indent-blankline = {
        enable = true;
        setupOpts.indent.char = "▏";
        setupOpts.indent.tab_char = "▏";
      };
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "gruvbox";
      };
    };
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      transparent = false;
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete = {
      blink-cmp.enable = true;
    };

    snippets.luasnip.enable = true;

    filetree = {
      neo-tree.enable = true;
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
    };

    minimap = {
      minimap-vim.enable = false;
    };

    utility = {
      diffview-nvim.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      illuminate.enable = true;
      fastaction.enable = true;
    };

    comments = {
      comment-nvim.enable = true;
    };
  };
}
