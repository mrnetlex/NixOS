{config, pkgs, ...}:

{
  # Environmnet variables
  environment.variables = {
    EDITOR = "micro";
    TERM = "kitty";
    HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    AMD_VULKAN_ICD = "RADV";
    NIXOS_OZONE_WL = "1";
  };
}
