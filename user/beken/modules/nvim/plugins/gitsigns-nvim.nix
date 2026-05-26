{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("gitsigns").setup({})
    vim.keymap.set("n", "<Leader>d", ":Gitsigns preview_hunk_inline<CR>")
  '';
}
