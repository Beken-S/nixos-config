{ config, pkgs, ... }: {
    catppuccin.waybar = {
        enable = true;
	flavor = "frappe";
    };

    programs.waybar= {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                modules-left = [ "niri/workspaces" ];
                modules-center = [ "clock" ];
                modules-right = [ "niri/language" "pulseaudio" "backlight" "battery" "network" ];

		"niri/workspaces" = {
		    format = "{index}";
	            on-click = "activate";
		    sort-by-number = true;
		};

		"niri/language" = {
		    format = "{short}";
		    format-en = "en";
		    format-ru = "ru";
		};
            };
        };
    };
}
