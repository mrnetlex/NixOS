{config, pkgs, ...}:
{
  # Change limits for audio programs
  security.pam.loginLimits = [
    {
      domain = "@username";
      item = "nofile";
      type = "hard";
      value = "524288";
    }
  ];
}
