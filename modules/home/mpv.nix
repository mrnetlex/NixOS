{ config
, pkgs
, ...
}: {
  programs.mpv = {
    enable = true;
    profiles = {
      SDR = {
        profile = "gpu-hq";
        vo = "gpu-next";
        target-colorspace-hint = true;
        gpu-api = "vulkan";
        gpu-context = "waylandvk";
        scale = "ewa_lanczossharp";
        cscale = "ewa_lanczossharp";
        tscale = "oversample";
        video-sync = "display-resample";
        interpolation = true;
        audio-channels = "stereo";
      };
      HDR = {
        profile = "gpu-hq";
        vo = "gpu-next";
        target-colorspace-hint = true;
        gpu-api = "vulkan";
        gpu-context = "waylandvk";
        video-output-levels = "limited";
        scale = "ewa_lanczossharp";
        cscale = "ewa_lanczossharp";
        tscale = "oversample";
        video-sync = "display-resample";
        interpolation = true;
        gamma = 8;
        brightness = 1;
        audio-channels = "stereo";
      };
    };
    defaultProfiles = [ "SDR" ];
    bindings = {
      "Ctrl+1" = "apply-profile SDR";
      "Ctrl+2" = "apply-profile HDR";
    };
  };
}
