{ pkgs, ... }:
{
  sddmBackground = pkgs.lib.mkDerivation {
    pname = "SDDM-background";
    version = "1.0";
    # Navigate two levels up from "themes" to the root, then into "assets"
    src = ../../../assets/Background-SDDM.jpg;
  };
}