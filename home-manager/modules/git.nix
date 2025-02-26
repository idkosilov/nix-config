{ config, pkgs, ... }:
let
  cfg = import ../../config.nix;
in {
  programs.git = {
    enable = true;
    userName = cfg.git.userName;
    userEmail = cfg.git.userEmail;
  };
}