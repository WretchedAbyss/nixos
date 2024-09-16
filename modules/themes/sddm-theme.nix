{ pkgs }:
let
  imageLink = "https://github.com/WretchedAbyss/nixos/blob/777bbdd95f1e8eb3ae38807d72c6bd0c7eb694ac/assets/Background-SDDM.jpg";

  image = pkgs.fetchurl {
    url = imageLink;
    sha256 = "sha256-frXjr4MeQsyYrd1dQZlgKOsp06qA3pFBtwL5x5LkyIk=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "where-is-my-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "v1.11.0";
    sha256 = "sha256-EzO+MTz1PMmgeKyw65aasetmjUCpvilcvePt6HJZrpo=";
  };

  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out
    cp -R ./where_is_my_sddm_theme/* $out/
    rm -r $out/example_configs
  '';
}