{ pkgs }:
let
  imageLink = "https://github.com/WretchedAbyss/nixos/blob/777bbdd95f1e8eb3ae38807d72c6bd0c7eb694ac/assets/Background-SDDM.jpg";

  image = pkgs.fetchurl {
    url = imageLink;
    sha256 = "0w9bysnrpscxhjpr81mha2sgkv8f8n7242v38qqppcg0mg9nip7n";
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