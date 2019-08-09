{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "cabal-simple"; version = "0.1.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "rodney.lorrimar@iohk.io";
      author = "Rodney Lorrimar";
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
          (hsPkgs."extra" or (builtins.throw "The Haskell package set does not contain the package: extra (build dependency)"))
          (hsPkgs."safe" or (builtins.throw "The Haskell package set does not contain the package: safe (build dependency)"))
          (hsPkgs."aeson" or (builtins.throw "The Haskell package set does not contain the package: aeson (build dependency)"))
          ];
        };
      exes = {
        "cabal-simple" = {
          depends = [
            (hsPkgs."base" or (builtins.throw "The Haskell package set does not contain the package: base (build dependency)"))
            (hsPkgs."cabal-simple" or (builtins.throw "The Haskell package set does not contain the package: cabal-simple (build dependency)"))
            (hsPkgs."extra" or (builtins.throw "The Haskell package set does not contain the package: extra (build dependency)"))
            (hsPkgs."optparse-applicative" or (builtins.throw "The Haskell package set does not contain the package: optparse-applicative (build dependency)"))
            ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.; }