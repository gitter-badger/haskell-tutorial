let
  pkgs = import <nixpkgs> {};
  blog = import ./blog {};

in
  pkgs.stdenv.mkDerivation rec {
    name = "haskell-tutorial";
    src = ./.;

    installPhase = ''
      mkdir -p $out
      ln -sv ${blog}/drafts $out/drafts
      ln -sv ${blog}/posts $out/posts
    '';

    phases = ["installPhase"];
  }