{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("trouble").setup({
        opts = {},
    })

    vim.keymap.set("n", "<leader>qq", "<cmd>Trouble diagnostics toggle focus=true<cr>")
    vim.keymap.set("n", "<leader>qQ", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
    vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
    vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
    vim.keymap.set("n", "<leader>qL", "<cmd>Trouble loclist toggle<cr>")
    vim.keymap.set("n", "<leader>qF", "<cmd>Trouble qflist toggle<cr>")
  '';
}
