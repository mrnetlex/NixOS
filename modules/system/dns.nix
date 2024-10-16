{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.custom;
in 
{
  options.custom.dns.enable = mkOption {
    type = types.bool;
    default = false;
    description = "Enable custom dns settings.";
  };

  config = mkIf cfg.dns.enable {
    #custom settings in here
    networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
    # Secure DNS
    services.dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;

        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };

        # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        server_names = [ "cloudflare" ];
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig = {
      StateDirectory = "dnscrypt-proxy";
    };
  };
}
