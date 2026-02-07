{config, pkgs, ...}:
{
  home.file.".config/guitarix/banks" = {
    source = ./../../dotfiles/guitarix/banks;
    recursive = true;
    force = true;
  };
}
