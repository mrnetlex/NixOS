{config, pkgs, ...}:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      oracle-flex = {
        port = 222;
      };
    };
  };
}
