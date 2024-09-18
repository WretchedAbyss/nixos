{ inputs, pkgs, lib, config, ... }:

let
  sddm = {
    enable = lib.mkEnableOption "Enable essential system applications";
  };
in {
  options = {
    # Define an option to toggle essential apps
    sddm = sddm;
  };

  config = lib.mkIf config.sddm.enable {
    # Add desktopApps
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "breeze";
  };
  };
}