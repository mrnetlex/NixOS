{ config, pkgs, ...}: 
{
  programs.mpv = {
    enable = true;
    config = {
		fullscreen = true;
      	fs-screen = 0;
        screen = 0;
      	window-maximized = "yes";
      	keep-open = "no";
        alang = "eng,en,enUS,en-US";
        slang = "eng,en,enUS,en-US";
        subs-fallback = "no";
        sid = "auto";
        
        profile = "gpu-hq";
        vo = "gpu-next";
        hwdec = "auto-safe";
        target-colorspace-hint = true;
        gpu-api = "vulkan";
        gpu-context = "waylandvk";
        
		glsl-shader = "./../../dotfiles/shaders/FSRCNNX_x2_8-0-4-1.glsl;./../../dotfiles/shaders/KrigBilateral.glsl;./../../dotfiles/shaders/SSimDownscaler.glsl";
		# glsl-shader = "./../../dotfiles/shaders/KrigBilateral.glsl";
		# glsl-shader = "./../../dotfiles/shaders/SSimDownscaler.glsl";
        dscale= "catmull_rom";
        video-sync = "display-resample";
        interpolation = true;
        deband = true;
        dither-depth = "auto";
        video-output-levels= "full";
        
        audio-channels = "stereo";
   };
   scripts = [
   	pkgs.mpvScripts.autoload
   ];
     
    };
}
