{
  flake.modules.nixos.boot = { lib, ... }: {
    boot = {
      loader = {
        efi.canTouchEfiVariables = true;
        limine = {
          enable = true;
          efiSupport = true;
          style.wallpapers = lib.mkForce [ ];
        };
      };
      plymouth = {
        enable = true;
        theme = "bgrt";
      };
      consoleLogLevel = 0;
      kernelParams = [
        "quiet"
        "splash"
        "loglevel=3"
        "udev.log_level=3"
        "rd.systemd.show_status=false"
      ];
    };
  };
}
