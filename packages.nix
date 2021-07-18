{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = {

  pls = (
    with import ./pls.nix { inherit nixpkgs; };
    [
      pls
      please
      plz
    ]
  );

  "nix 21.05 18th July 2021" = (

    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/b2f87e0043aaf3f0f05cc983bd6aa80a616b8352.tar.gz") { };
    [
      pre-commit
      git
      hadolint
      nixpkgs-fmt
      nodePackages.prettier
      bash
      docker
    ]
  );
}; in
with pkgs;
pkgs."nix 21.05 18th July 2021" ++ pls
