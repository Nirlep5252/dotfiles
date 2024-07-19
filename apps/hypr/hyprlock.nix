{ ... }: {
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    "$monitor" = "eDP-1";
    general = {};

    background = {
      monitor = "$monitor";
      path = "~/Pictures/Wallpapers/mountains.jpg";

      blur_passes = 3;
      blur_size = 4;
    };

    input-field = {
      monitor = "$monitor";
      size = "200, 50";
      outline_thickness = 3;
      dots_size = 0.33;
      dots_spacing = 0.15;
      dots_center = false;
      dots_rounding = -1;
      outer_color = "rgb(151515)";
      inner_color = "rgb(200, 200, 200)";
      font_color = "rgb(151515)";
      fade_on_empty = true;
      fade_timeout = 1000;
      placeholder_text = "<span style=\"italic\" color=\"##666\">Input Password...</span>";
      hide_input = false;
      rounding = -1;
      fail_color = "rgb(204, 34, 34)";
      fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
      fail_transition = 300;

      position = "0, 0";
      halign = "center";
      valign = "center";
    };

    label = {
      monitor = "$monitor";
      text = "Life is all about <i>Formality</i>...";
      color = "rgba(200, 200, 200, 1.0)";
      font_size = 25;
      font_family = "GeistMono Nerd Font Mono";

      position = "0, 80";
      halign = "center";
      valign = "center";
    };
  };
}
