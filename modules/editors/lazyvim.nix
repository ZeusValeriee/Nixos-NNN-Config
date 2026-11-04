{ inputs, ... }:
{
  flake.modules.homeManager.lazyvim = {
    imports = [ inputs.lazyvim-nix.homeManagerModules.default ];
    programs.lazyvim = {
      enable = true;
    };
  };
}