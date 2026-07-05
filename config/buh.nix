{
  opts = {
    # linenumbers
    number = true;
    relativenumber = true;
    wrap = false;

    # tab settings
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    shiftround = true;
    smartindent = true;
    cursorline = true;
    scrolloff = 10;
    sidescrolloff = 5;

    # search
    ignorecase = true;
    smartcase = true;
    incsearch = true;

    # list chars
    list = true;
    listchars = {
      tab = "➡ ";
      trail = "°";
      # space = ".";
    };
  };

  globals.mapleader = " ";

  keymaps = [
    {
      mode = "n";
      key = "<leader>q";
      action = ":q<CR>";
      options.silent = false;
    }
    {
      mode = "n";
      key = "<leader>w";
      action = ":w<CR>";
      options.silent = false;
    }
  ];

  colorschemes.gruvbox.enable = true;

  lsp = {
    inlayHints.enable = true;

    servers = {
      nixd = {
        enable = true;
        config = {
          nixpkgs.expr = "import <nixpkgs> {}";
          formatting.command = [ "alejandra" ];
          options =
            let
              # wait how the fuck do i get the flake now
              flake = ''(builtins.getFlake "/home/mikko5/nixos-config")'';
            in
            {
              nixos.expr = "${flake}.nixosConfigurations.mikko5.options";
            };
        };
      };

      zls = {
        enable = true;
      };
    };
  };

  plugins = {
    bufferline.enable = true;
    web-devicons.enable = true;

    lspconfig.enable = true;
    lsp-format.enable = true;
    lsp-lines.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "cmdline"; }
      ];
    };

    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;

      settings = {
        pickers.find_files.hidden = true;
      };
    };
  };
}
