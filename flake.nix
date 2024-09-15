{
  description = "Main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-stable";

    home-manager = {
        url ="github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    polymc.url = "github:PolyMC/PolyMC";
    nix-comfyui.url = "github:dyscorv/nix-comfyui";
    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };
  };

  outputs = { self, nixpkgs, grub2-themes, ... }@inputs:
  let system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      overlays = [
      inputs.nix-comfyui.overlays.default
      ];
      config = {
        allowUnfree = true;
        };
    };
  in
    {
    nixosConfigurations = {
      mainNixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };

        modules = [
        ./system/configuration.nix
        grub2-themes.nixosModules.default
        ];
       };
      };

    };


}
