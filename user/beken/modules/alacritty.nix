{ ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding.x = 8;
        padding.y = 8;
        decorations = "None";
      };

      selection = {
        save_to_clipboard = true;
      };
    };
  };
}
