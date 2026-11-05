{ lib, ... }:
{
  options.meta = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
  };

  config.meta = {
    hostName = "nixos";
    flakePath = "/etc/nixos";
    flakeHost = "laptop";
    stateVersion = "26.05";
    timeZone = "Asia/Manila";
    locale = "en_US.UTF-8";

    owner = {
      username = "angelo";
      name = "angelo";
      email = "245304898+ZeusValerie@users.noreply.github.com";
    };

    gpu = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    fan.nbfcConfigId = null;

    theme = {
      scheme = "nord";
      polarity = "dark";
      cursor = {
        name = "Bibata-Modern-Ice";
        size = 24;
      };
    };
  };
}