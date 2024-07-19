{ ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nirlep5252";
  home.homeDirectory = "/home/nirlep5252";
  home.stateVersion = "23.11";

  fonts.fontconfig.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  imports = [
    ./pkgs.nix
    ./cli/_import.nix
    ./apps/_import.nix
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
