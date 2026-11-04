{
  flake.modules.nixos.fonts = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        # system
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        dejavu_fonts
        symbola
        nerd-fonts.symbols-only
        # microsoft
        corefonts
        vista-fonts
        # prompt
        meslo-lgs-nf
      ];
    };
  };
}
