{ inputs, ... }:

{
  imports = [
    inputs.self.darwinModules.example
  ];

  networking.hostName = "host1";

  system.stateVersion = 6;
}
