{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.2";
      identifier = { name = "cabal-sublib"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "moritz.angermann@iohk.io";
      author = "Moritz Angermann";
      homepage = "";
      url = "";
      synopsis = "";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (builtins.throw "The Haskell package set does not contain the package: base (build dependency)"))
          (hsPkgs."slib" or (builtins.throw "The Haskell package set does not contain the package: slib (build dependency)"))
          ];
        };
      sublibs = {
        "slib" = {
          depends = [
            (hsPkgs."extra" or (builtins.throw "The Haskell package set does not contain the package: extra (build dependency)"))
            (hsPkgs."safe" or (builtins.throw "The Haskell package set does not contain the package: safe (build dependency)"))
            (hsPkgs."aeson" or (builtins.throw "The Haskell package set does not contain the package: aeson (build dependency)"))
            ];
          };
        };
      exes = {
        "cabal-sublib" = {
          depends = [
            (hsPkgs."base" or (builtins.throw "The Haskell package set does not contain the package: base (build dependency)"))
            (hsPkgs."cabal-sublib" or (builtins.throw "The Haskell package set does not contain the package: cabal-sublib (build dependency)"))
            (hsPkgs."extra" or (builtins.throw "The Haskell package set does not contain the package: extra (build dependency)"))
            (hsPkgs."optparse-applicative" or (builtins.throw "The Haskell package set does not contain the package: optparse-applicative (build dependency)"))
            ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.; }