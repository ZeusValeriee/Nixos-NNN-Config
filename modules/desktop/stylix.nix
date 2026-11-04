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
      
      base16Scheme = {
        base00 = "edecf2";
        base01 = "e2e3e8";
        base02 = "e2e3e8";
        base03 = "9da2ad";
        base04 = "42434e";
        base05 = "282930";
        base06 = "282930";
        base07 = "0f1014";
        base08 = "525666";
        base09 = "525666";
        base0A = "50535e";
        base0B = "2e3038";
        base0C = "4a4f52";
        base0D = "5f6370";
        base0E = "50535e";
        base0F = "2e3038";
      };

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