{ pkgs }:
let
  imageLink = "https://github.com/WretchedAbyss/nixos/blob/777bbdd95f1e8eb3ae38807d72c6bd0c7eb694ac/assets/Background-SDDM.jpg";
  SegoeUIVariableURL = "https://aka.ms/SegoeUIVariable";
  SegoeFluentIconsURL = "https://aka.ms/SegoeFluentIcons";
  image = pkgs.fetchurl {
    url = imageLink;
    sha256 = "sha256-frXjr4MeQsyYrd1dQZlgKOsp06qA3pFBtwL5x5LkyIk=";
  };
  SegoeUIVariable = pkgs.fetchurl {
    url = SegoeUIVariableURL;
    sha256 = "sha256-UIfhkyq9vWdzCqxGX88rnr2/2JEClC5HYZf/x0oU7Vc=";
  };
  SegoeFluentIcons = pkgs.fetchurl {
    url = SegoeFluentIconsURL;
    sha256 = "sha256-hyCLlUOtFzg6GxspL+kTPFRrogsryCSXW+NypIUbPkQ=";
  };

in
pkgs.stdenv.mkDerivation {
  name = "win11-sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "birbkeks";
    repo = "win11-sddm-theme";
    rev = "1.0";
    sha256 = "sha256-GhEQvGtFpDVXYeCQhYg9ksFXcwZx5X7ie3ocbbpud/g=";
  };
  nativeBuildInputs = [ pkgs.unzip ];
  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    rm $out/Backgrounds/lc_1.jpg
    cp ${image} $out/Backgrounds/lc_1.jpg
    mkdir -p $out/fonts
    unzip -o ${SegoeUIVariable} -d $out/fonts/
    unzip -o ${SegoeFluentIcons} -d $out/fonts/
  '';
}