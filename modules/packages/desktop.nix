{
  flake.modules.nixos.packages-desktop = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.wl-clipboard ];
  };

  flake.modules.homeManager.packages-desktop = { pkgs, ... }: {
    home.packages = with pkgs; [
      # browser
      firefox
      brave-origin
      # internet
      thunderbird
      telegram-desktop
      discord
      # terminal
      ghostty 
      # files
      nautilus
      # office
      libreoffice
      obsidian
      # cad
      librecad
      freecad
      kicad
      # computations
      octaveFull
      pspp
      qgis
      # media
      mpv
      vlc
      # development
      vscodium
      # games
      retroarch
      steam
      # graphics
      inkscape
      gimp
      scribus
      krita
      rawtherapee
      darktable
      blender
      # multimedia
      obs-studio
      audacity
      ardour
      lmms
      kdePackages.kdenlive
      shotcut
      # gtk
      foliate
      gearlever 
      gnome-boxes
      loupe
      showtime
      evince
      amberol
      bottles
    ];
  };
}
