{
  flake.modules.nixos.power = {
   services.power-profiles-daemon.enable = false;
   
   services.tuned.enable = true; 
   services.upower.enable = true;
  };
}
