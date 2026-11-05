{
  flake.modules.nixos.flatpak = { pkgs, ... }: {
    services.flatpak.enable = true;
  };
}
