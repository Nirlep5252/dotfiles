{ pkgs, ... }:

{
  home.packages = [
    # terminal emulators
    pkgs.kitty
    pkgs.wezterm
    pkgs.foot

    # code editors
    pkgs.vscode
    pkgs.neovim
    pkgs.neovide

    # menus
    pkgs.wofi
    pkgs.rofi-wayland

    pkgs.dconf
    pkgs.gcc
    pkgs.firefox
    pkgs.fastfetch
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
    pkgs.tesseract
    pkgs.sway-contrib.grimshot
    pkgs.zed-editor
    pkgs.xdg-utils
    pkgs.rose-pine-cursor
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.geist-font
    pkgs.ripgrep
    pkgs.dig
    pkgs.ciscoPacketTracer8
    pkgs.dooit
    pkgs.gtk2
    pkgs.brave
    pkgs.libstdcxx5
    pkgs.poetry
    pkgs.libclang
    pkgs.mpv
    pkgs.qt5.full
    pkgs.shotcut
    pkgs.ffmpeg

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.requests
      python-pkgs.jupyter
      python-pkgs.jupyter_client
      python-pkgs.pynvim
      python-pkgs.ueberzug
      python-pkgs.cairosvg
      python-pkgs.pnglatex
      python-pkgs.pillow
      python-pkgs.pyperclip
      python-pkgs.plotly
      python-pkgs.pytesseract
      python-pkgs.torch-bin
      python-pkgs.torchvision-bin
      python-pkgs.torchaudio-bin
      (python-pkgs.safetensors.override { torch = python-pkgs.torch-bin; })
      python-pkgs.einops
      # python-pkgs.transformers
      python-pkgs.nltk
      # python-pkgs.spacy
      python-pkgs.wordcloud
      python-pkgs.pyspellchecker
      python-pkgs.gensim
      python-pkgs.anyqt
      python-pkgs.pyqt5
      python-pkgs.icecream
    ]))
    (pkgs.nerdfonts.override
      { fonts = [ "FiraCode" "GeistMono" ]; }
    )
  ];
}
