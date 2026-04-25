{ pkgs, ... }: {
  # 这里的配置会生成系统级的 /etc/gitconfig
  environment.etc."gitconfig".text = ''
    [user]
      name = Jing Pu
      email = chpu437@163.com
    [core]
      editor = vim
  '';
}
