{
  pkgs,
  hostName,
  userName,
  nvim-spell-ru-utf8-dictionary,
  nvim-spell-ru-utf8-suggestions,
  ...
}:
{
  stylix.targets.neovim.enable = false;

  programs.ripgrep.enable = true;
  programs.fd.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = (import ./plugins { inherit pkgs hostName userName; });
    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
      lua-language-server
      stylua
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./lua/core.lua}
      ${builtins.readFile ./lua/keymaps.lua}
    '';
  };

  xdg.configFile."nvim/spell/ru.utf-8.spl".source = nvim-spell-ru-utf8-dictionary;
  xdg.configFile."nvim/spell/ru.utf-8.sug".source = nvim-spell-ru-utf8-suggestions;
  xdg.configFile."nvim/queries/lua/highlights.scm".text = ''
    ; extends
    (string) @spell
    (identifier) @spell
  '';
  xdg.configFile."nvim/queries/nix/highlights.scm".text = ''
    ; extends
    (identifier) @spell
    (string_fragment) @spell
  '';
}
