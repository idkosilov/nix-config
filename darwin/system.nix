{ ... }: {
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "bat";
  };

  networking = {
    dns = [ "1.1.1.1" "8.8.8.8" ]; # Cloudflare & Google DNS for faster lookups
    knownNetworkServices = [
      "Wi-Fi"
      "Ethernet Adaptor"
      "Thunderbolt Ethernet"
    ];
  };

  system.defaults = {
    finder = {
      ShowPathbar = true; # Show full path in Finder
      ShowStatusBar = true; # Show status bar
      FXPreferredViewStyle = "clmv"; # Use Column View by default
      AppleShowAllFiles = true; # Show hidden files
    };

    controlcenter = {
      AirDrop = false;
      FocusModes = false;
      BatteryShowPercentage = true; # Show battery percentage
    };

    menuExtraClock = {
      ShowSeconds = true;
    };

    dock = {
      magnification = false; # Enable Dock icon magnification
      tilesize = 45; # Set Dock icon size
      minimize-to-application = true; # Minimize to app icons
      show-recents = false; # Hide recent apps
      static-only = true; # Show only pinned apps in Dock
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true; # Show file extensions
      AppleInterfaceStyle = "Dark"; # Dark Mode
      NSAutomaticSpellingCorrectionEnabled = false; # Disable auto-correct
      NSWindowResizeTime = 0.001; # Speed up window resizing
      KeyRepeat = 2; # Faster key repeat
      InitialKeyRepeat = 15; # Reduce key repeat delay
      ApplePressAndHoldEnabled = false; # Disable press-and-hold for keys (better for fast typing)
      NSAutomaticCapitalizationEnabled = false; # Disable automatic capitalization
      NSAutomaticPeriodSubstitutionEnabled = false; # Prevent auto-inserting `.` when double-spacing
    };

    loginwindow = {
      GuestEnabled = false; # Disable guest user login
    };

    SoftwareUpdate = {
      AutomaticallyInstallMacOSUpdates = false; # Do not auto-install  updates
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  power = {
    restartAfterPowerFailure = true;
    sleep.computer = "never";
  };
}