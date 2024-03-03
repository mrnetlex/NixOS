{ config, pkgs, ... }:

{
  # Environmnet variables
  environment.variables = {
    EDITOR = "micro";
    TERM = "kitty";
    HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    AMD_VULKAN_ICD = "RADV";
    ENABLE_HDR_WSI = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };
}
