{
  pkgs,
  hostName,
  userName,
}:
with pkgs.vimPlugins;
[
  (import ./catppuccin-nvim.nix { plugin = catppuccin-nvim; })
  (import ./gitsigns-nvim.nix { plugin = gitsigns-nvim; })
  (import ./mini-files.nix { plugin = mini-files; })
  (import ./telescope-nvim.nix { plugin = telescope-nvim; })
  (import ./telescope-fzf-native-nvim.nix { plugin = telescope-fzf-native-nvim; })
  (import ./bufferline-nvim.nix { plugin = bufferline-nvim; })
  (import ./lualine-nvim.nix { plugin = lualine-nvim; })
  (import ./toggleterm-nvim.nix { plugin = toggleterm-nvim; })
  nui-nvim
  plenary-nvim
  nvim-web-devicons
  (import ./nvim-lspconfig {
    inherit hostName userName;
    plugin = nvim-lspconfig;
  })
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  (import ./nvim-cmp.nix { plugin = nvim-cmp; })
  (import ./nvim-treesitter.nix { plugin = nvim-treesitter.withAllGrammars; })
  (import ./trouble-nvim.nix { plugin = trouble-nvim; })
  (import ./conform-nvim.nix { plugin = conform-nvim; })
  (import ./nvim-lint.nix { plugin = nvim-lint; })
]
