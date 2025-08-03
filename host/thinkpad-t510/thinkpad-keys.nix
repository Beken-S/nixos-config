{ config, pkgs, ... } : {
    services.udev.extraRules = ''
       SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{KEY}=="113", RUN+="${pkgs.coreutils}/bin/echo XF86AudioMute > /proc/keyboard" 

       SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{KEY}=="114", RUN+="${pkgs.coreutils}/bin/echo XF86AudioLowerVolume > /proc/keyboard" 

       SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{KEY}=="115", RUN+="${pkgs.coreutils}/bin/echo XF86AudioRaiseVolume > /proc/keyboard" 

       SUBSYSTEM=="input", ATTRS{name}=="ThinkPad Extra Buttons", ENV{KEY}=="248", RUN+="${pkgs.coreutils}/bin/echo XF86AudioMicMute > /proc/keyboard" 

       SUBSYSTEM=="input", ENV{ACPI_EVENT}=="video/brightnessup", RUN+="${pkgs.coreutils}/bin/echo XF86MonBrightnessUp > /proc/keyboard" 

       SUBSYSTEM=="input", ENV{ACPI_EVENT}=="video/brightnessdown", RUN+="${pkgs.coreutils}/bin/echo XF86MonBrightnessDown > /proc/keyboard" 
    '';
}

