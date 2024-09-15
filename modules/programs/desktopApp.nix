{ inputs, pkgs, lib, config, ... }:

let
  desktopApps = {
    enable = lib.mkEnableOption "Enable essential system applications";
  };
in {
  options = {
    # Define an option to toggle essential apps
    desktopApps = desktopApps;
  };

  config = lib.mkIf config.desktopApps.enable {
    # Add desktopApps
    
  };
}