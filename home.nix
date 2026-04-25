{ pkgs, ... }: {
  # Home Manager 需要这个版本号来保持兼容性
  home.stateVersion = "25.11"; 

  # 这里可以放置你个人的软件包，只对你生效
  home.packages = [];

  # 声明式管理 Git（进阶玩法）
  programs.git = {
    enable = true;
    settings.user.name = "Jing Pu";
    settings.user.email = "chpu437@163.com";
  };

  # 让 Home Manager 帮你管理 Ghostty 的配置文件
  # 这会生成 ~/.config/ghosttty/config
  xdg.configFile."ghosttty/config".text = ''
    font-size = 14
  '';
}