{
  pkgs,
  hostName,
  userName,
  ...
}:
{
  stylix.targets.neovim.enable = false;

  programs.ripgrep.enable = true;
  programs.fd.enable = true;

  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style
    lua-language-server
    stylua
    nodePackages.cspell
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = (import ./plugins { inherit pkgs hostName userName; });
    extraLuaConfig = ''
      ${builtins.readFile ./lua/core.lua}
      ${builtins.readFile ./lua/keymaps.lua}
    '';
  };
}
