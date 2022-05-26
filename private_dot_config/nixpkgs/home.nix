{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    direnv
    exa
    htop
    jq
  ];

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jrubin";
  home.homeDirectory = "/home/jrubin";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  programs.readline = {
    enable = true;
    includeSystemConfig = false;
    extraConfig = "set editing-mode vi";
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  services = {
    lorri.enable = true;
  };
}
