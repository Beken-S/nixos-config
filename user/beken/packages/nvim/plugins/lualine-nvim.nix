{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("lualine").setup({
        options = {
            globalstatus = true,
            theme = "catppuccin"
        },
    })
  '';
}
