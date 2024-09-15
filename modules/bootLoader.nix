{ inputs, pkgs, lib, config, ... }:

let
  bootLoader = {
    enable = lib.mkEnableOption "Enable essential system applications";
  };
in {
  options = {
    # Define an option to toggle essential apps
    bootLoader = bootLoader;
  };

  config = lib.mkIf config.bootLoader.enable {
    # Add games
  };
}