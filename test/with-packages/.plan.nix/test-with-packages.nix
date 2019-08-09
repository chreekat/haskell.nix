{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.2";
      identifier = { name = "test-with-packages"; version = "0.1.0.0"; };
      license = "NONE";
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
          ];
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.; }