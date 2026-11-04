{ config, ... }:
let
  inherit (config.meta) gpu;
in
{
  flake.modules.nixos.nvidia = { config, ... }: {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        inherit (gpu) intelBusId nvidiaBusId;
      };
    };
  };
}
