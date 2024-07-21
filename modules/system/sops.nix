{ config, pkgs, inputs, systemSettings, ...}:

{
  environment.systemPackages = with pkgs; [
  	sops
  	age
  ];

#  imports =
#    [
#      inputs.sops-nix.nixosModules.sops
#    ];

  sops = {

    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      # automatically impost host SSH keys as age keys
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      # this will use an age key that is expected to already be in filesystem
      keyFile = "/home/keys.txt";
      # generate a new key if the key specified above does not exist
      generateKey = true;
    };

    # secrets will be output to /run/secrets
    # e.g. /run/secrets/smb-creds
    secrets = {
      smb-creds = { };
      netlex-password = { };
      private-ssh = { };
    };
  };
}
