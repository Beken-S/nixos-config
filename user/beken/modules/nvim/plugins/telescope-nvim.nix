{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("telescope").setup({})
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<Leader>fw", builtin.live_grep, {})
    vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
  '';
}
