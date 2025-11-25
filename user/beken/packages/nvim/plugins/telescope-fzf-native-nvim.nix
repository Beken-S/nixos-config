{ plugin }:
{
  inherit plugin;
  type = "lua";
  config = ''
    require("telescope").load_extension("fzf")
  '';
}
