{
  description = "A very basic flake for developing with the zig 0.12 toolchain";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.zig_0_12
        pkgs.fish
      ];

      shellHook = ''
        exec fish
      '';
    };
  };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
}
