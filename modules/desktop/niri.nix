{ config, ... }:
let
  inherit (config.meta.theme) cursor;
in
{
  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri.enable = true;
    environment.systemPackages = [ pkgs.xwayland-satellite pkgs.swaybg ];
  };

  flake.modules.homeManager.niri = { config, ... }: 
  let
    stylix = config.lib.stylix.colors;
  in
  {
    xdg.configFile."niri/config.kdl".text =
      ''
        cursor {
            xcursor-theme "${cursor.name}"
            xcursor-size ${toString cursor.size}
        }
        layout {
            gaps 10
            
            default-column-width { proportion 1.0; }
            
            focus-ring {
                width 1
                active-color "#${stylix.base05}ff"
                inactive-color "#${stylix.base05}40"
            }
            border {
                width 1
                active-color "#${stylix.base05}ff"
                inactive-color "#${stylix.base05}40"
            }
        }
      ''
      + builtins.readFile ../../assets/niri.kdl;
  };
}