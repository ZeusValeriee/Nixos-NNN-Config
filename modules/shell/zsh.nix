{ config, ... }:
let
  inherit (config) meta;
  target = "${meta.flakePath}#${meta.flakeHost}";
in
{
  flake.modules.nixos.zsh = { pkgs, ... }: {
    programs.zsh.enable = true;
    users.users.${meta.owner.username}.shell = pkgs.zsh;
  };

  flake.modules.homeManager.zsh = { pkgs, ... }: {
    home.packages = [ pkgs.lazygit ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        ignoreDups = true;
        saveNoDups = true;
        size = 10000;
        expireDuplicatesFirst = true;
        share = true;
      };

      setOptions = [
        "AUTO_CD"
        "AUTO_PUSHD"
        "PUSHD_IGNORE_DUPS"
      ];

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
      };

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      initContent = ''
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      '';

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ${target}";
        drybuild = "sudo nixos-rebuild dry-build --flake ${target}";
        update = "sudo nix flake update --flake ${meta.flakePath} && sudo nixos-rebuild switch --flake ${target}";
        cl = "clear";
        free = "df -h /";
        nixgit = "lazygit --path /etc/nixos";
        ls = "eza";
        ll = "eza -l";
        la = "eza -a";
        lt = "eza --tree";
        cat = "bat";
        grep = "rg";
        top = "btop";
        du = "dust";
        gc = "sudo nix-collect-garbage -d";
        optimise = "sudo nix store optimise";
        cleanup = "sudo nix-collect-garbage -d && sudo nix store optimise";
      };
    };
  };
}