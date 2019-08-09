{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = {};
    package = {
      specVersion = "2.2";
      identifier = { name = "test-haddock"; version = "0.1.0.0"; };
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
          (hsPkgs."stm" or (builtins.throw "The Haskell package set does not contain the package: stm (build dependency)"))
          ];
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ./.; }
