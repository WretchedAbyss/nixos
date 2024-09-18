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
     nix-prefetch-git
     sddm-chili-theme
     (where-is-my-sddm-theme.override {
    themeConfig.General = {
        background = toString ../../assets/Background-SDDM.jpg;
        backgroundMode = "fill";
        showUsersByDefault=true;
        sessionsFontSize=13;
        usersFontSize=22;
        showSessionsByDefault=true;
        passwordFontSize=28;
        passwordInputWidth=0.10;
    };
})
     libsForQt5.sddm
     wget
     git
     htop
     unzip
     neofetch
     zsh
     neovim 
     home-manager
  ];
  };
}