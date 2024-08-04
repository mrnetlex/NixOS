{config, pkgs, ...}:

{
    programs = {
    firefox = {
      enable = true;
      languagePacks = [ "pl" "en-GB" ];
      policies = {
              DisableTelemetry = true;
              DisableFirefoxStudies = true;
              DisablePocket = true;
              DisableFirefoxScreenshots = true;
              DontCheckDefaultBrowser = true;
             };
}
