{
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
}