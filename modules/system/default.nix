{config, pkgs, ...}:

{
  imports = [
    ./drives.nix
    ./fish.nix
    ./nfs.nix
    ./samba.nix
    ./security.nix
    ./docker.nix
    ./stylix.nix
  ];
}
