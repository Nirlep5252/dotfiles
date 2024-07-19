{ pkgs, ... }:

{
  home.packages = [
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
    pkgs.killall

    (pkgs.nerdfonts.override
      { fonts = [ "FiraCode" "GeistMono" ]; }
    )
  ];
}
