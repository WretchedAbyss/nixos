{ pkgs }:
let
  imageLink = "https://github.com/WretchedAbyss/nixos/blob/777bbdd95f1e8eb3ae38807d72c6bd0c7eb694ac/assets/Background-SDDM.jpg";

  image = pkgs.fetchurl {
    url = imageLink;
    sha256 = "sha256-frXjr4MeQsyYrd1dQZlgKOsp06qA3pFBtwL5x5LkyIk=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "win11-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "birbkeks";
    repo = "win11-sddm-theme";
    rev = "v1.0";
    sha256 = "0pgqdhcp0i5haqj8c6anzlwyh7gf7s59pv1c3chf4xmbagbz6w1f";
  };

  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}