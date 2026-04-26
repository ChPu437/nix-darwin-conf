{ pkgs, ... }: {
  # Home Manager 需要这个版本号来保持兼容性
  home.stateVersion = "25.11"; 

  # 这里可以放置你个人的软件包，只对你生效
  home.packages = [];

  # 导入配置
  imports = [ 
    ./karabiner.nix # 自定义快捷键
    ./ssh.nix # SSH 配置
  ];

  # 声明式管理 Git
  programs.git = {
    enable = true;
    settings = {
      user.name = "Jing Pu";
      user.email = "chpu437@163.com";
      init.defaultBranch = "main";
      # 强制 Git 使用 SSH 而不是 HTTPS (这样就不用输密码了)
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  home.file."Library/Application Support/com.mitchellh.ghostty/config.ghostty".text = ''
    font-family = JetBrainsMono Nerd Font
    font-size = 16
    theme = Breeze
  '';

  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    
    # 1. 替代原来的 .zshrc 中的别名
    shellAliases = {
      drb = "sudo darwin-rebuild switch --flake ~/.nix-darwin.d";
      ll = "ls -l";
      vi = "vim";
    };

    # 2. 替代 .zshrc 中的自定义初始化代码
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    # 3. 替代 .zprofile 中的内容
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv zsh)"

      # Added by OrbStack: command-line tools and integration
      # This won't be added again if you remove it.
      source ~/.orbstack/shell/init.zsh 2>/dev/null || :
    '';
  };  
}
