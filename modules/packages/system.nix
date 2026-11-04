{
  flake.modules.nixos.packages-system = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      # core
      git
      vim
      wget
      curl
      # hardware
      pciutils
      usbutils
      mesa-demos
      usb-modeswitch
      udisks2
      # filesystem
      btrfs-progs
      compsize
      exfatprogs
      ntfs3g
      dosfstools
      e2fsprogs
      xfsprogs
      f2fs-tools
      parted
      gparted
      gvfs
      nfs-utils
      cifs-utils
      # android
      android-tools
    ];
  };
}