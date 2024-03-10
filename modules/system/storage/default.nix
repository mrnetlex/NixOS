{ config, pkgs, ... }:

{
  imports = [
    ./drives.nix
    ./nfs.nix
    ./samba.nix
  ];
}
