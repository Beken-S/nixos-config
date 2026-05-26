{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("bufferline").setup({
        highlights = require("catppuccin.special.bufferline").get_theme()
    })
  '';
}
