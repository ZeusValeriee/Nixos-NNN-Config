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
      polarity = "dark"; 
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme.scheme}.yaml";
      cursor = {
        package = pkgs.bibata-cursors;
        inherit (theme.cursor) name size;
      };

      icons = {
        enable = true;
        package = pkgs.papirus-icon-theme.override { color = "blue"; };
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };

      targets = {
        qt.enable = true;
        plymouth.enable = false;
      };
    };

    # Required for GTK apps to read the dark mode preference
    programs.dconf.enable = true;
  };

  flake.modules.homeManager.stylix = {
    stylix.autoEnable = true; 
    stylix.targets = {
      gtk.enable = true;
      qt.enable = true;
    };
  };
}