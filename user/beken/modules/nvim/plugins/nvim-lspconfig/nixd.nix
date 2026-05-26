{ hostName, userName }:
''
  vim.lsp.config("nixd", {
      cmd = { "nixd" },
      settings = {
          nixd = {
              nixpkgs = { expr = "import <nixpkgs> { }", },
              formatting = { command = { "nixfmt" }, },
              options = {
                  nixos = {
                      expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.${hostName}.options',
                  },
                  home_manager = {
                      expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."${userName}@${hostName}".options',
                  },
              },
          },
      },
  })

  vim.lsp.enable("nixd")
''
