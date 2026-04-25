{ pkgs, ... }: {
  # 这里的配置会生成系统级的 /etc/gitconfig
  users.users.jing = {
    name = "jing";
    home = "/Users/jing";
  };
}
