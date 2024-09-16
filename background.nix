{ inputs, pkgs, lib, config, ... }:
{
  sddmBackground = pkgs.lib.mkDerivation {
    name = "SDDM-background";
    version = "1.0";
    # Navigate two levels up from "themes" to the root, then into "assets"
    src = ./assets/Background-SDDM.jpg;
  };
}