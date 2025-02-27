{ pkgs, config, ... }: {
  nixpkgs.config.allowUnfree = true;

  # List of system-wide packages to be installed
  environment.systemPackages = with pkgs; [
    zoxide       # Smart `cd` alternative, lets you jump to frequently used directories
    git          # Distributed version control system
    gh           # GitHub CLI tool for managing repositories and PRs
    lazygit      # TUI (Terminal User Interface) for Git, makes Git easier to use
    neovim       # Modern Vim-based editor with better plugin support
    curl         # Command-line tool for making HTTP requests
    rsync        # Efficient file transfer and synchronization tool
    unzip        # Extracts `.zip` archives
    ripgrep      # Ultra-fast `grep` replacement for searching inside files
    jq           # Command-line JSON processor (like `grep`, but for JSON)
    fd           # Modern `find` replacement (faster and more user-friendly)
    bat          # Enhanced `cat` with syntax highlighting and Git integration
    fzf          # Fuzzy finder, great for searching command history or files
    htop         # Interactive system monitor (`top` replacement)
    tmux         # Terminal multiplexer, allows multiple terminal sessions
    lsd          # Enhanced `ls` with colors, icons, and tree view (`lsd --tree`)
    tldr         # Simplified `man` pages with practical examples
    mtr          # Combines `ping` and `traceroute` for network diagnostics
    iperf3       # Measures network speed and bandwidth
    nmap         # Powerful network scanner, useful for security audits
    socat        # Networking tool for working with sockets (like `netcat`)
    httpie       # User-friendly alternative to `curl` for making API requests
    glow         # Terminal-based Markdown viewer
    neofetch     # Displays system information with an ASCII logo
    wireshark    # Network protocol analyzer for monitoring traffic
    mpv          # Lightweight media player with powerful features
    ffmpeg       # Command-line tool for processing multimedia files
    obsidian     # Note-taking and knowledge management application
    telegram-desktop # Desktop client for Telegram messenger
    kitty        # Fast, GPU-accelerated terminal emulator
    lens         # GUI for managing Kubernetes cluster
    poetry       # Poetry python package manager
    uv           # UV python package manager
  ];

  # Fonts configuration - installing additional fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code         # Standard FiraCode font for better coding readability
    font-awesome      # Icon font used in UI applications and web development
  ];

  # Homebrew configuration
  homebrew = {
    enable = true;  # Enable Homebrew package management

    brews = [
      "mas" # CLI tool for managing Mac App Store applications
    ];

    # Casks - GUI applications installed via Homebrew
    casks = [
      "yandex-music" # Yandex Music desktop application
      "outline-manager" # VPN management tool
      "orbstack"        # Lightweight Docker and Linux environment for macOS
    ];

    # Mac App Store applications installed via `mas`
    masApps = {
      "Outline-Secure internet access" = 1356178125; # Outline VPN application
    };
  };
}
