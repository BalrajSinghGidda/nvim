{
  description = "Balraj's standalone nvf config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }:
  let
    system = "x86_64-linux"; # we'll fix mac later
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = nvf.lib.neovimConfiguration {
      inherit pkgs;

      modules = [
        ./config
      ];
    };
  };
}
