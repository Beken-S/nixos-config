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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = (import ./plugins { inherit pkgs hostName userName; });
    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
      lua-language-server
      stylua
      codebook
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./lua/core.lua}
      ${builtins.readFile ./lua/keymaps.lua}
    '';
  };

  xdg.configFile."codebook/codebook.toml".text = ''
    dictionaries = ["en_us", "ru"]
  '';
}
