{ inputs, config, ... }:
let
  inherit (config) meta;
  inherit (config.flake.modules) nixos homeManager;
in
{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ./_hardware-configuration.nix
      {
        system.stateVersion = meta.stateVersion;
        home-manager.users.${meta.owner.username}.imports = with homeManager; [
          # shell
          zsh
          git
          # desktop
          niri
          noctalia
          stylix
          # packages
          packages-desktop
          packages-cli
          # editors
          lazyvim
          doom-emacs
          # system
          storage
        ];
      }
    ] ++ (with nixos; [
      # host
      laptop-filesystems
      # system
      boot
      kernel
      nix
      locale
      networking
      users
      zram
      bluetooth
      power
      storage
      # hardware
      intel
      nvidia
      nbfc
      audio
      printing
      # desktop
      niri
      noctalia
      fonts
      stylix
      # services
      ollama
      # shell
      zsh
      # packages
      packages-system
      packages-desktop
      overlays
    ]);
  };
}
