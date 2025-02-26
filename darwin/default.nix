{ pkgs, ... }: {
  imports = [
    ./packages.nix
    ./system.nix
  ];
}