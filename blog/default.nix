{ nixpkgs ? import <nixpkgs> {} }:

let
  inherit (nixpkgs) pkgs;
in
  pkgs.stdenv.mkDerivation {
    name = "haskell-tutorial-blog";
    src = ./.;
    installPhase = ''
      mkdir -p $out
      cp -r $src/drafts $out/
      cp -r $src/posts $out/
    '';
    phases = ["installPhase"];
  }