{
  flake.modules.nixos.printing = { pkgs, ... }: {
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        # canon
        canon-cups-ufr2
        cnijfilter2
        # epson
        epson-escpr
        epson-escpr2
        # brother
        brlaser
        brgenml1lpr
        brgenml1cupswrapper
        # hp
        hplip
      ];
    };
  };
}
