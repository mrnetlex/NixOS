{ config, pkgs, systemSettings, ...}:

{
    services.openssh = {
    enable = true;
    ports = [ 2137 ];
    settings = {
        PasswordAuthentication = true;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
    };

    networking.firewall.allowedTCPPorts = [ 2137];

}
