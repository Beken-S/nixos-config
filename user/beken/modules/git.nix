{ fullUserName, userEmail, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = fullUserName;
        email = userEmail;
      };
      alias = {
        history = ''log --graph --date=format:"%d.%m.%y" --format=format:"%C(bold yellow)%h%C(reset) - %s%C(red bold)%d%C(reset) %C(brightblack italic)-- %an %ar%C(reset)%n" --all'';
      };
      core.editor = "nvim";
    };
  };
}
