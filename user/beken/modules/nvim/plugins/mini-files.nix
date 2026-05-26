{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("mini.files").setup({
      mappings = {
        close = '<Esc>',
      },
    })

    local minifiles_toggle = function(...)
      if not MiniFiles.close() then MiniFiles.open(...) end
    end

    vim.keymap.set("n", "<Leader>t", function()
      minifiles_toggle(nil, false)
    end)
    vim.keymap.set("n", "<Leader>T", function()
      minifiles_toggle(vim.api.nvim_buf_get_name(0), false)
    end)
  '';
}
