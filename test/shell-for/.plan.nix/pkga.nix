{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.2";
      identifier = { name = "pkga"; version = "0.1.0.0"; };
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
          (hsPkgs."lens" or (builtins.throw "The Haskell package set does not contain the package: lens (build dependency)"))
          (hsPkgs."text" or (builtins.throw "The Haskell package set does not contain the package: text (build dependency)"))
          ];
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../pkga; }