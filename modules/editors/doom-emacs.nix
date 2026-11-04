{ inputs, ... }:
{
  flake.modules.homeManager.doom-emacs = { pkgs, ... }: {
    imports = [ inputs.nix-doom-emacs-unstraightened.homeModule ];
    home.packages = with pkgs; [
      cmake
      gnumake
      gcc
      libvterm
    ];

    programs.doom-emacs = {
      enable = true;
      doomDir = ./doom.d;
    };
  };
}