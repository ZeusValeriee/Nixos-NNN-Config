{
  flake.modules.nixos.printing = { pkgs, ... }: {
    services.printing.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing.drivers = with pkgs; [
      gutenprint
      gutenprintBin
      foomatic-db
      foomatic-db-nonfree
      foomatic-db-ppds-withNonfreeDb

      hplip
      hplipWithPlugin

      brlaser
      brgenml1lpr
      brgenml1cupswrapper

      cnijfilter2

      epson-escpr
      epson-escpr2

      splix
      samsung-unified-linux-driver

      postscript-lexmark
    ];

    environment.systemPackages = with pkgs; [
      system-config-printer
      cups-filters
    ];
  };
}
