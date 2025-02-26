{ homeStateVersion, user, homeDirectory, host, ... }: {
  imports = [
    ./modules
  ];

  home = {
    username = user;
    homeDirectory = homeDirectory;
    stateVersion = homeStateVersion;
  };
}