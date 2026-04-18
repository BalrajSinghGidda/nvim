{
	description = "Balraj's standalone nvf config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nvf.url = "git+https://github.com/notashelf/nvf";
	};
outputs = { self, nixpkgs, nvf, ... }:
let
  systems = [ "x86_64-linux" "x86_64-darwin" ];
in
{
  packages = nixpkgs.lib.genAttrs systems (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
      default = (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ ./config ];
      }).neovim;
    }
  );

  apps = nixpkgs.lib.genAttrs systems (system:
    let pkg = self.packages.${system}.default;
    in {
      default = {
        type = "app";
        program = "${pkg}/bin/nvim";
      };
    }
  );
};
}
