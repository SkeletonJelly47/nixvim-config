{
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
    };
  };
}
