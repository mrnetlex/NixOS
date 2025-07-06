{ pkgs, ... }: 

{
  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      search_mode = "fuzzy";
      session_path = "/run/secrets/atuin-session";
      key_path = "/run/secrets/atuin-key";
    enableFishIntegration= true;
    };
  };
}
