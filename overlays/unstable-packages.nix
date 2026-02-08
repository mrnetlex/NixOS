{ inputs }:
final: prev:
let
  unstable = import inputs.nixpkgs {
    system = prev.stdenv.hostPlatform.system;
    config = prev.config;
  };
in
{
  fresh-editor = unstable.fresh-editor;
  unstable = unstable;
}
