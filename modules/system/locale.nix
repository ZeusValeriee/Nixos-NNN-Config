{ config, ... }:
let
  inherit (config) meta;
in
{
  flake.modules.nixos.locale = {
    time.timeZone = meta.timeZone;
    i18n.defaultLocale = meta.locale;
  };
}
