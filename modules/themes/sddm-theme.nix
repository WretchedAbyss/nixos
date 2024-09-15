{ pkgs }:
let
  image = builtins.path {
    path = ../../../assets/Background-SDDM.jpg;
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-chili";
  version = "0.1.5";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-chili";
    rev = "0.1.5";
    sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
  };

  buildInputs = [ ];
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm assets/background.jpg || true
    cp ${image} $out/assets/background.jpg
    ls -lh $out/assets/  # Verify the image is copied
  '';
}