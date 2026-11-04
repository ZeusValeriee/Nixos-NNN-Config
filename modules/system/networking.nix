{ config, ... }:
let
  inherit (config) meta;
in
{
  flake.modules.nixos.networking = {
    networking = {
      hostName = meta.hostName;
      networkmanager.enable = true;

      firewall = {
        enable = true;
        allowedTCPPorts = [ 53317 ];
        allowedUDPPorts = [ 53317 ];
      };
    };
  };
}