{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.2";
      identifier = { name = "pkgb"; version = "0.1.0.0"; };
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
          (hsPkgs."pkga" or (builtins.throw "The Haskell package set does not contain the package: pkga (build dependency)"))
          (hsPkgs."conduit" or (builtins.throw "The Haskell package set does not contain the package: conduit (build dependency)"))
          (hsPkgs."conduit-extra" or (builtins.throw "The Haskell package set does not contain the package: conduit-extra (build dependency)"))
          (hsPkgs."directory" or (builtins.throw "The Haskell package set does not contain the package: directory (build dependency)"))
          (hsPkgs."resourcet" or (builtins.throw "The Haskell package set does not contain the package: resourcet (build dependency)"))
          ];
        };
      exes = {
        "pkgb" = {
          depends = [
            (hsPkgs."base" or (builtins.throw "The Haskell package set does not contain the package: base (build dependency)"))
            (hsPkgs."pkgb" or (builtins.throw "The Haskell package set does not contain the package: pkgb (build dependency)"))
            (hsPkgs."optparse-applicative" or (builtins.throw "The Haskell package set does not contain the package: optparse-applicative (build dependency)"))
            (hsPkgs."text" or (builtins.throw "The Haskell package set does not contain the package: text (build dependency)"))
            ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../pkgb; }