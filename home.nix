{ pkgs, ... }:

{
  home.username = "robin";
  home.homeDirectory = "/home/robin";

  # Compatibility defaults for this Home Manager configuration; do not routinely change.
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    wget
    curl
    pi-coding-agent
    wl-clipboard
    nodejs_26
    pnpm_12

    bat
    fzf
    ripgrep
    fd
    btop
    neovim
    ghq
    go_1_27
    ghostty
    uv
    jq
    yq-go
    eza
  ];

  # Enable the shell hook so zoxide's `z` command can change directories.
  programs.bash.enable = true;
  programs.zoxide.enable = true;

  # Git is installed system-wide; only its personal configuration is managed here.
  programs.git = {
    enable = true;
    package = null;

    settings = {
      user = {
        name = "Robin Hagmayer";
        email = "robin.hagmayer@gmail.com";
      };
      core.autocrlf = "input";
      init.defaultBranch = "main";
      pull.rebase = true;
      fetch.prune = true;
      rerere.enabled = true;
      merge.conflictStyle = "zdiff3";
    };
  };
}
