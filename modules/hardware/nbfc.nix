{
  flake.modules.nixos.nbfc = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.nbfc-linux ];

    systemd.tmpfiles.rules = [ "d /var/lib/nbfc 0755 root root -" ];

    systemd.services.nbfc_service = {
      description = "NoteBook FanControl service";
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.kmod ];
      
      unitConfig.ConditionPathExists = "/var/lib/nbfc/nbfc.json";
      
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.nbfc-linux}/bin/nbfc_service --config-file /var/lib/nbfc/nbfc.json";
        Restart = "on-failure";
      };
    };
  };
}