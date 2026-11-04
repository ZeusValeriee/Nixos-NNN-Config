{ inputs, config, ... }:
let
  inherit (config) meta;
  user = meta.owner.username;
in
{
  flake.modules.nixos.users = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    users.users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "storage" ];
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.${user}.home = {
        username = user;
        homeDirectory = "/home/${user}";
        stateVersion = meta.stateVersion;
      };
    };
  };
}
