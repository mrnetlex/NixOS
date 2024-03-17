{config, pkgs, ...}:
{
  # Change limits for esync
  security.pam.loginLimits = [
    {
      domain = "@username";
      item = "nofile";
      type = "hard";
      value = "524288";
    }
  ];
}
