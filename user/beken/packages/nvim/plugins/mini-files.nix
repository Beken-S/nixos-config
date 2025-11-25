{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("mini.files").setup()
  '';
}
