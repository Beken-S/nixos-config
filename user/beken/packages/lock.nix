{
  config,
  pkgs,
  lib,
  ...
}:
{
  stylix.targets.swaylock.enable = false;

  programs.swaylock = {
    enable = true;
    settings =
      let
        font = config.stylix.fonts.serif.name;

        color = with config.lib.stylix.colors; {
          transparent = "00000000";
          background = base00;
          primary = base01;
          accent = base03;
          info = base0D;
          warning = base0A;
          error = base08;
          text = base05;
        };

        iconSize = "80px";

        image =
          pkgs.runCommand "swaylock-icon.png"
            {
              nativeBuildInputs = [ pkgs.imagemagick ];
            }
            ''
              cat > temp.svg <<EOF
                  <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="${iconSize}"
                      height="${iconSize}"
                      viewBox="0 -960 960 960"
                      fill="#${color.primary}"
                  >
                      <path d="M220-80q-24.75 0-42.37-17.63Q160-115.25 160-140v-434
                               q0-24.75 17.63-42.38Q195.25-634 220-634h70v-96
                               q0-78.85 55.61-134.42Q401.21-920 480.11-920
                               q78.89 0 134.39 55.58Q670-808.85 670-730v96h70
                               q24.75 0 42.38 17.62Q800-598.75 800-574v434
                               q0 24.75-17.62 42.37Q764.75-80 740-80H220Zm260.17-200
                               q31.83 0 54.33-22.03T557-355q0-30-22.67-54.5
                               t-54.5-24.5q-31.83 0-54.33 24.5t-22.5 55
                               q0 30.5 22.67 52.5t54.5 22ZM350-634h260v-96
                               q0-54.17-37.88-92.08-37.88-37.92-92-37.92
                               T388-822.08q-38 37.91-38 92.08v96Z"/>
                  </svg>
              EOF

              magick temp.svg -background transparent PNG:$out
            '';
      in
      {
        daemonize = true;

        inherit font image;
        font-size = 18;

        scaling = "center";

        indicator-radius = 90;
        indicator-thickness = 10;
        indicator-idle-visible = true;
        indicator-caps-lock = true;
        disable-caps-lock-text = true;

        color = color.background;

        layout-bg-color = color.transparent;
        layout-border-color = color.transparent;
        layout-text-color = color.text;

        bs-hl-color = color.info;
        key-hl-color = color.accent;
        caps-lock-bs-hl-color = color.info;
        caps-lock-key-hl-color = color.warning;

        ring-color = color.primary;
        ring-caps-lock-color = color.primary;
        ring-clear-color = color.info;
        ring-ver-color = color.accent;
        ring-wrong-color = color.error;

        separator-color = color.transparent;

        inside-color = color.transparent;
        inside-caps-lock-color = color.transparent;
        inside-clear-color = color.background;
        inside-ver-color = color.background;
        inside-wrong-color = color.background;

        line-uses-inside = true;

        text-color = color.text;
        text-clear-color = color.info;
        text-ver-color = color.text;
        text-wrong-color = color.error;
      };
  };

  services =
    let
      niri = lib.getExe pkgs.niri;
      swaylock = lib.getExe config.programs.swaylock.package;
      pidof = lib.getExe' pkgs.procps "pidof";
      systemctl = config.systemd.user.systemctlPath;
    in
    {
      swayidle = {
        enable = true;

        timeouts = [
          {
            timeout = 30;
            command = "${pidof} swaylock && ${niri} msg action power-off-monitors";
          }
          {
            timeout = 300;
            command = "${pidof} swaylock || ${niri} msg action spawn -- ${swaylock}";
          }
          {
            timeout = 330;
            command = "${pidof} swaylock && ${niri} msg action power-off-monitors";
          }
          {
            timeout = 900;
            command = "${pidof} swaylock && ${systemctl} suspend";
          }
        ];

        events = [
          {
            event = "before-sleep";
            command = "${niri} msg action power-off-monitors";
          }
          {
            event = "after-resume";
            command = "${niri} msg action power-on-monitors";
          }
        ];
      };
    };
}
