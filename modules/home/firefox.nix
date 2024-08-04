{config, pkgs, ...}:

{
    programs.firefox = {
      enable = true;
      languagePacks = [ "pl" "en-GB" ];
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxScreenshots = true;
        DontCheckDefaultBrowser = true;
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
      # settings = {
      #   "browser.aboutConfig.showWarning" = false;
      #   "browser.tabs.warnOnCloseOtherTabs" = false;
      # };
   	};
}
