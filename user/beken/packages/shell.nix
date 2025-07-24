{ config, pkgs, lib, ... }: {
    programs.bash.enable = true;

    programs.starship = let
        divider = fg: bg: "[](bg:${bg} fg:${fg})";
    in {
        enable = true;
        enableBashIntegration = true;
        settings = {
            add_newline = true;
            format = lib.concatStrings [
                "[](cyan)"
                "$directory"
                (divider "cyan" "red")
                "$git_branch"
                (divider "red" "yellow")
                "$git_commit"
                (divider "yellow" "bright-black")
                "$git_status"
                (divider "bright-black" "black")
                " "
            ];
            directory = {
                style = "bg:cyan fg:black" ;
                format = "[$path ]($style)";
                truncation_symbol ="…/";
            };
            git_branch = {
                symbol = "󰘬 ";
                style = "bg:red fg:black";
                format = "[ $symbol$branch ]($style)";
            };
            git_commit = {
                style = "bg:yellow fg:black";
                format = "[ $hash ]($style)";
            };
            git_status = {
                style = "bg:bright-black fg:black";
                format = "[( $modified$staged )]($style)";
                modified = "!";
                staged = "+";
            };
        };
    };
}

