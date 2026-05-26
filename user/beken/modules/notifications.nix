{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
  ];

  stylix.targets.swaync.enable = false;

  services.swaync =
    let
      cornerRadius = "6px";
      circularRadius = "9999px";
      color = config.lib.stylix.colors.withHashtag;
    in
    {
      enable = true;
      settings = {
        control-center-margin-top = 3;
        control-center-margin-bottom = 3;
        control-center-margin-right = 3;
        timeout = 5;
        timeout-low = 3;
        notification-window-width = 400;
      };
      style = ''
        * {
            font-family: ${config.stylix.fonts.sansSerif.name};
            font-size: ${toString config.stylix.fonts.sizes.desktop}pt;
        }

        .control-center {
            padding: 0.1em 0.6em;
            border:2px solid ${color.base0D};
            border-radius: ${cornerRadius};
            background: ${color.base00};
        }

        progress {
            min-height: 0.4em;
        }

        trough {
            min-height: 0.4em;
            background: ${color.base00};
        }

        .notification {
            border-radius: ${cornerRadius};
            background: ${color.base00};
            box-shadow: none;
        }

        .notification.low {
            border: 2px solid ${color.base03};
        }

        .notification.low progress {
            background: ${color.base03};
        }

        .notification.low trough {
            border: 1px solid ${color.base03};
        }

        .notification.normal {
            border: 2px solid ${color.base0D};
        }

        .notification.normal progress {
            background: ${color.base0D};
        }

        .notification.normal trough {
            border: 1px solid ${color.base0D};
        }

        .notification.critical {
            border: 2px solid ${color.base08};
        }

        .notification.critical progress {
            background: ${color.base08};
        }

        .notification.critical trough {
            border: 1px solid ${color.base08};
        }

        .notification-content {
            padding: 0.6em 1.2em;
            border-radius: ${cornerRadius};
        }

        .notification-default-action {
            border-radius: ${cornerRadius};
        }

        .notification-default-action:hover {
            background: ${color.base02};
        }

        .notification-default-action:active {
            background: ${color.base03};
        }

        .notification-action {
            border-radius: ${cornerRadius};
            background: ${color.base00};
            color: ${color.base05};
        }

        .notification-action:hover {
            background: ${color.base02};
        }

        .notification-action:active {
            background: ${color.base03};
        }

        .summary {
            margin-bottom: 0.2em;
            color: ${color.base05};
        }

        .body {
            color: ${color.base05};
        }

        .time {
            color: ${color.base05};
            font-weight: normal;
            font-size: 0.9rem;
            font-style: italic;
        }

        .close-button {
            margin-top: 0.3em;
            margin-right: 0.2em;
            min-width: 1.5em;
            min-height: 1.5em;
            background: ${color.base00};
            color: ${color.base05};
        }

        .close-button:hover {
            background: ${color.base02};
        }

        .close-button:active {
            background: ${color.base03};
        }

        .widget-title > label {
            font-weight: bold;
            font-size: 1.4rem;
            color: ${color.base05};
        }

        .widget-title > button {
            border-radius: 8px;
            background: ${color.base00};
            color: ${color.base05};
        }

        .widget-title > button:hover {
            background: ${color.base02};
        }

        .widget-title > button:active {
            background: ${color.base03};
        }

        .widget-dnd {
            color: ${color.base05};
        }

        .widget-dnd > switch {
            border-radius: ${circularRadius};
            background: ${color.base01};
        }

        .widget-dnd > switch:hover {
            background: ${color.base02};
        }

        .widget-dnd > switch:checked {
            background: ${color.base0D};
        }

        .widget-dnd > switch slider {
            background: ${color.base00};
        }

        .collapsed.notification-group:hover .notification {
            background: ${color.base02};
        }

        .notification-group-headers {
            margin-left: 20px;
        }

        .notification-group-headers > label {
            font-weight: normal;
            color: ${color.base05};
        }

        .notification-group-buttons {
            margin-right: 26px;
            margin-bottom: 6px;
        }

        .notification-group-buttons > button {
            min-height: 1.2em;
            min-width: 1.2em;
            background: ${color.base01};
            color: ${color.base05};
        }

        .notification-group-buttons > button:hover {
            background: ${color.base02};
        }

        .notification-group-buttons > button:active {
            background: ${color.base03};
        }

        .notification-group-icon {
            color: ${color.base03};
        }

        .floating-notifications .notification-background {
            padding-top: 3px;
            padding-right: 3px;
        }

        .control-center-list-placeholder {
            color: ${color.base03};
        }
      '';
    };
}
