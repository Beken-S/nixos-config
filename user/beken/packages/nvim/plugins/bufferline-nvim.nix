{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get()
    })
  '';
}
