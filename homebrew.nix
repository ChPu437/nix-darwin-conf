{ pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # 这种硬核配置最适合放在独立文件里管理

    brews = [
      "powerlevel10k"
    ];

    casks = [
      "visual-studio-code"
      "clash-verge-rev"
      "orbstack"
      "mactex"
      "topnotch"
      "ghostty"
      "playcover-community"
    ];

    # 如果以后有 App Store 软件也可以写在这
    # masApps = { "Bitwarden" = 1352778147; };
  };
}
