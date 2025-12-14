{ inputs, ... }:

{
  imports = [
    inputs.self.darwinModules.example
  ];

  networking.hostName = "host2";

  system.stateVersion = 6;
}
