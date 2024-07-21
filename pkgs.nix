{ pkgs, ... }:

{
  home.packages = [
    pkgs.dconf
    pkgs.gcc
    pkgs.neovim
    pkgs.kitty
    pkgs.firefox
    pkgs.fastfetch
    pkgs.wofi
    pkgs.vscode
    pkgs.waybar
    pkgs.wl-clipboard
    pkgs.cliphist
    pkgs.cargo
    pkgs.rustc
    pkgs.unzip
    pkgs.grim
    pkgs.slurp
    pkgs.fzf
    pkgs.zoxide
    pkgs.xdg-desktop-portal-hyprland
    pkgs.tree
    pkgs.xfce.thunar
    pkgs.lxde.lxsession
    pkgs.networkmanagerapplet
    pkgs.swayimg
    pkgs.python313
    pkgs.gnumake
    pkgs.cmake
    pkgs.ninja
    pkgs.glxinfo
    pkgs.libGL
    pkgs.libGLU
    pkgs.mesa
    pkgs.meson
    pkgs.hwdata
    pkgs.hyprcursor
    pkgs.bun
    pkgs.openssl
    pkgs.nodejs_22
    pkgs.nodePackages_latest.prisma
    pkgs.cinnamon.nemo
    pkgs.whitesur-cursors
    pkgs.luajitPackages.luarocks

    (pkgs.nerdfonts.override
      { fonts = [ "FiraCode" "GeistMono" ]; }
    )
  ];
}
