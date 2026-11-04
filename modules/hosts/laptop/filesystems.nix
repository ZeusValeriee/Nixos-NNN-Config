{
  flake.modules.nixos.laptop-filesystems = {
    fileSystems = {
      "/".options = [ "compress=zstd:4" "noatime" ];
      "/home".options = [ "compress=zstd:4" "noatime" ];
    };
  };
}
