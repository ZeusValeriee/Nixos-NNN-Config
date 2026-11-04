{
  flake.modules.homeManager.packages-cli = { pkgs, ... }: {
    home.packages = with pkgs; [
      # search & navigation
      ripgrep
      fd
      fzf
      zoxide
      eza
      # files & viewing
      unzip
      tree
      bat
      dust
      # monitoring & system
      btop
      htop
      powertop
      wev
      # data & formatting
      jq
      yq
      glow
      # shell & git helpers
      atuin
      tealdeer
      starship
      tig
      gh
      lazygit
      # python & development
      (python3.withPackages (ps: with ps; [
        pip
        virtualenv
        setuptools
        wheel
        ipython
        ptpython
        python-lsp-server
      ]))
      uv
      poetry
    ];
  };
}