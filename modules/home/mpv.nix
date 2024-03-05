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
      test = {
      	fullscreen = true;
      	fs-screen = 0;
        screen = 0;
      	window-maximized = "yes";
      	keep-open = "no";
        alang = "eng,en,enUS,en-US";
      	
      	vo = "gpu-next";
      	gpu-api = "vulkan";
      	gpu-context = "waylandvk";
      	target-colorspace-hint = true;
      	
      	profile = "gpu-hq";
      	hwdec = "auto-safe";
      	
      	ytdl-format = "bv*[height<=2160]+ba/b[height<=2160]";
      	scale = "ewa_lanczossharp";
      	cscale = "ewa_lanczossharp";
      	deband = true;
      	      
      	interpolation = true;
      	video-sync = "display-resample";
      	tscale = "oversample";
      };
      clean = {
      	
      };
    };
    defaultProfiles = [ "test" ];
    bindings = {
      "Ctrl+1" = "apply-profile SDR";
      "Ctrl+2" = "apply-profile HDR";
      "Ctrl+3" = "apply-profile test";
      "Ctrl+4" = "apply-profile clean";
    };
  };
}
