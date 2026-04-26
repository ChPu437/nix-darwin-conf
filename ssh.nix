# ~/.nix-darwin.d/ssh.nix
# ssh.nix
{ ... }: {
  programs.ssh = {
    enable = true;
    
    # 修复警告 2：显式关闭未来会被移除的默认值
    enableDefaultConfig = false;

    matchBlocks = {
      # 修复警告 1：将 addKeysToAgent 移动到具体的 block 内部
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        # 只针对 GitHub 自动添加密钥到代理
        addKeysToAgent = "yes"; 
      };

      # 模拟警告建议的默认行为：针对所有其他主机 (*) 的配置
      "*" = {
        # 如果你希望所有 SSH 链接都尝试自动添加密钥到代理，也可以写在这里
        addKeysToAgent = "yes";
        # 允许转发 SSH Agent (可选，安全起见默认关闭)
        forwardAgent = false;
      };
    };
  };
}