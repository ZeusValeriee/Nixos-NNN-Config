{ inputs, config, ... }:
let
  inherit (config.meta) theme;
in
{
  flake.modules.nixos.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];

    stylix = {
      enable = true;
      autoEnable = true;
      inherit (theme) polarity;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme.scheme}.yaml";
      cursor = {
        package = pkgs.bibata-cursors;
        inherit (theme.cursor) name size;
      };

      icons = {
        enable = true;
        package = pkgs.papirus-icon-theme.override { color = "black"; };
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };

      targets = {
        qt.enable = true;
        plymouth.enable = false;
      };
    };

    programs.dconf.enable = true;
  };

  flake.modules.homeManager.stylix = {
    stylix.targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };
}