{ lib, pkgs, ... }:
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
    # save & quit
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

    # telescope
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options.silent = true;
    }

    # lsp
    {
      mode = "n";
      key = "gr";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>lua vim.lsp.buf.format()<CR>";
      options.silent = true;
    }
  ];

  colorschemes.gruvbox.enable = true;

  lsp = {
    inlayHints.enable = true;

    # vimjoyer code editor video: https://youtu.be/M_zMoHlbZBY&t=245
    # https://github.com/Ahwxorg/nixvim-config/blob/master/config/modules/plugins/lsp.nix
    servers = {
      nixd = {
        enable = true;
        config = {
          nixpkgs.expr = "import <nixpkgs> {}";
          formatting.command = [ (lib.getExe pkgs.alejandra) ];
          options =
            let
              # wait how the fuck do i get the flake now
              flake = ''(builtins.getFlake "/home/mikko5/nixos-config")'';
            in
            {
              nixos.expr = "${flake}.nixosConfigurations.mikko5.options";
              # nixvim.expr = "${flake}.packages.";
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
      extensions.fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
          override_file_sorter = true;
          override_generic_sorter = true;
          case_mode = "smart_case";
        };
      };

      settings = {
        # pickers.find_files.hidden = true;
      };
    };

    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          buftypes = [
            "terminal"
            "quickfix"
          ];
          filetypes = [
            ""
            "checkhealth"
            "help"
            "lspinfo"
            "TelescopePrompt"
            "TelescopeResults"
          ];
        };
        indent = {
          char = "▏";
          tab_char = "▏";
        };
        scope = {
          enabled = true;
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };
  };
}
