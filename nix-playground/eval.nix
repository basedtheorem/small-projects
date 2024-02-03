let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-22.11";
  pkgs = import nixpkgs { config = { }; overlays = [ ]; };
in
pkgs.lib.evalModules {
  modules = [
    ./default.nix
    ({ config, ... }: { config._module.args = { inherit pkgs; }; })
  ];
}
