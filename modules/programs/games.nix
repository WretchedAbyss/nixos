{ inputs, pkgs, lib, config, ... }:

let
  games = {
    enable = lib.mkEnableOption "Enable essential system applications";
  };
in {
  options = {
    # Define an option to toggle essential apps
    games = games;
  };

  config = lib.mkIf config.games.enable {
    # Add games
    nixpkgs.overlays = [ inputs.polymc.overlay ];
    environment.systemPackages = with pkgs; [
     polymc
  ];
  };
}