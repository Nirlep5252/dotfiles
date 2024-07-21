{ ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "GeistMono Nerd Font";
      size = 16;
    };
    shellIntegration.enableZshIntegration = true;
  };
}
