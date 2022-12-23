{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    controlMaster = "no";
    controlPath = "none";

    matchBlocks = {
      "personal" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/personal";
      };
      "work" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/work";
      };
      "magneto" = {
        hostname = "magneto";
        user = "build";
        controlMaster = "auto";
        controlPath = "~/.ssh/%r@%h:%p";
        controlPersist = "yes";
        identityFile = "~/.ssh/magneto";
      };
    };
  };
}
