{ ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "GeistMono Nerd Font Mono";
      size = 16;
    };
    shellIntegration.enableZshIntegration = true;
  };
}
