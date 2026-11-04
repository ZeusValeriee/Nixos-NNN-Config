{
  flake.modules.nixos.storage = { pkgs, ... }:
  {
    services.udisks2.enable = true;
    services.gvfs.enable = true;
  };

  flake.modules.homeManager.storage = {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
    };
  };
}