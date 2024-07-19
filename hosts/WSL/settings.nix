{
  systemSettings = {
        system = "x86_64-linux";
        username = "netlex";
        timezone = "Europe/Warsaw";
        locale = "en_US.UTF-8";
      };
}
## So how does this shit works? 
# This attribute set is imported and then inherited in specialArgs in flake.nix
# By doing this I can access all my variables per system
# REMEMBER to pass "systemSettings" in inputs (i guess) of given file, next standard {config, pkgs, ...}
# if you want to use variables in this file