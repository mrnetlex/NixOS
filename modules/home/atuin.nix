{ pkgs, config, ... }: 

{
  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      search_mode = "fuzzy";
      style = "full";
      enter_accept = true;
      session_path = config.sops.secrets.atuin-session.path;
      key_path = config.sops.secrets.atuin-key.path;
    enableFishIntegration= true;
    };
  };
}
