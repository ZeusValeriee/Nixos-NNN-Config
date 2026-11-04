{ config, ... }:
let
  inherit (config.meta) owner;
in
{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings.user = {
        inherit (owner) name email;
      };
    };
  };
}
