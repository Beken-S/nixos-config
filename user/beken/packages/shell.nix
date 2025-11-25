{ lib, ... }:
{
  programs.bash.enable = true;

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_status"
        " "
      ];
      directory = {
        style = "bold cyan";
        format = "[$path]($style)";
        truncation_symbol = "…/";
      };
      git_branch = {
        symbol = "󰘬 ";
        style = "bold red";
        format = "[ $symbol$branch]($style)";
      };
      git_commit = {
        style = "bold yellow";
        format = "[ $hash]($style)";
      };
      git_status = {
        style = "red";
        format = "[( \\[$modified$staged\\])]($style)";
        modified = "!";
        staged = "+";
      };
    };
  };
}
