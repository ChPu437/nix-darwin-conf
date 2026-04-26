{ pkgs, ... }: {
  # 这里的配置会生成系统级的配置文件，适用于所有用户
  users.users.jing = {
    name = "jing";
    home = "/Users/jing";
  };

  # 使用指纹鉴权
  security.pam.services.sudo_local.touchIdAuth = true;

  # skhd
  # 1. 安装软件
  environment.systemPackages = [
    pkgs.skhd
    # pkgs.karabiner-elements
  ];

  # 2. 启用 skhd 服务
  services.skhd = {
    enable = true;
    # 绑定快捷键：这里我们先预留 Hyper + Return
    # 在 skhd 中，cmd + shift + ctrl + alt 可以缩写为 ^ + ~ + $ + @，但为了清晰，我们直接定义
    skhdConfig = ''
      # 定义组合键逻辑
      # hyper (cmd + shift + ctrl + alt) + return
      cmd + shift + ctrl + alt - return : open -na /Applications/Ghostty.app
    '';
  };

  # 3. 启用 Karabiner 服务
  services.karabiner-elements.enable = false;
}
