{ pkgs, lib, config, ... }:

let
  essentialApps = {
    enable = lib.mkEnableOption "Enable essential system applications";
  };
in {
  options = {
    # Define an option to toggle essential apps
    essentialApps = essentialApps;
  };

  config = lib.mkIf config.essentialApps.enable {
    # Add essential system apps here
    environment.systemPackages = with pkgs; [
     kdePackages.kate
     kdePackages.plasma-pa
     kdePackages.sddm-kcm
     pkgs.sddm-chili-theme
     wget
     git
     htop
     neofetch
     zsh
     neovim 
     home-manager
  ];
  };
}