{ inputs }:
final: prev:
let
  unstable = import inputs.nixpkgs {
    system = prev.stdenv.hostPlatform.system;
    config = prev.config;
  };
in
{
  unstable = unstable;
  # With this above you can just reference pkgs.unstable.foo in your normal config
  # But you can also put some pkgs like this:
  #
  # foo = unstable.foo;
  #
  # and then put pkgs.foo in config
}
