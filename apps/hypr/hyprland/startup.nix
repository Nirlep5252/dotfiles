{ ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
    "nm-applet"
    "blueman-applet"
    "hyprpm reload -n"
    "lxpolkit"
  ];

  wayland.windowManager.hyprland.settings.exec = [
    "pkill waybar"
    "waybar"
  ];
}
