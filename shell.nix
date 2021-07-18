let nixpkgs = import <nixpkgs> { }; in
let pkgs = import ./packages.nix { inherit nixpkgs; }; in

nixpkgs.mkShell {
  buildInputs = pkgs;

  shellHook = ''
    pre-commit install --install-hooks
  '';

}
