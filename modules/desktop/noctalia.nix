{ config, lib, ... }:
let
  inherit (config.meta.theme) cursor;
  inherit (config.meta.owner) username; 
in
{
  flake.modules.nixos.noctalia = { pkgs, config, ... }:
  let
    stylix = config.lib.stylix.colors;
  in
  {
    services.displayManager.noctalia-greeter = {
      enable = true;
      passwordlessSyncUsers = [ username ];
      settings = {
        appearance = {
          scheme = "Synced";
          palette = {
            base00 = "#${stylix.base00}";
            base01 = "#${stylix.base01}";
            base02 = "#${stylix.base02}";
            base03 = "#${stylix.base03}";
            base04 = "#${stylix.base04}";
            base05 = "#${stylix.base05}";
            base06 = "#${stylix.base06}";
            base07 = "#${stylix.base07}";
            base08 = "#${stylix.base08}";
            base09 = "#${stylix.base09}";
            base0A = "#${stylix.base0A}";
            base0B = "#${stylix.base0B}";
            base0C = "#${stylix.base0C}";
            base0D = "#${stylix.base0D}";
            base0E = "#${stylix.base0E}";
            base0F = "#${stylix.base0F}";
          };
        };
        cursor = {
          theme = cursor.name;
          size = cursor.size;
          path = pkgs.bibata-cursors;
        };
      };
    };
  };

  flake.modules.homeManager.noctalia = {
    stylix.targets.noctalia.enable = true;
    programs.noctalia = {
      enable = true;
      settings = lib.mkMerge [
        (builtins.fromTOML (builtins.readFile ../../assets/noctalia.toml))
        {
          theme.source = lib.mkForce "custom";
          theme.mode = lib.mkForce "light";
        }
      ];
    };
  };
}