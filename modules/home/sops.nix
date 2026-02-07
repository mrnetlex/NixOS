{ config, pkgs, ... }:
{
  sops = {

    defaultSopsFile = ./../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      # this will use an age key that is expected to already be in filesystem
      keyFile = "/home/netlex/.config/sops/age/keys.txt";
      # generate a new key if the key specified above does not exist
      generateKey = true;
    };

    secrets = {
      atuin-session = { 
		mode = "0600";
      };
      atuin-key = { 
      	mode = "0600";
      };
    };
  };


}
