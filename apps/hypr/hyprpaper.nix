{ ... }: {
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = [
      "~/Pictures/Wallpapers/cat.png"
    ];

    wallpaper = [
      "eDP-1,~/Pictures/Wallpapers/cat.png"
    ];
  };
}
