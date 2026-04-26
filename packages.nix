{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.git
    pkgs.vim
    pkgs.fastfetch
    pkgs.ripgrep    # 现代搜索工具
    pkgs.sl
  ];
}
