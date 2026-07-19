# flakelight -- A Darwin module for flakelight
# Copyright (C) 2024 Calum MacRae <hi@cmacr.ae>
# SPDX-License-Identifier: MIT

{
  description = "A Darwin module for flakelight";

  inputs = {
    flakelight.url = "github:nix-community/flakelight";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "flakelight/nixpkgs";
    };
  };

  outputs = { flakelight, nix-darwin, ... }@inputs:
    flakelight ./. {
      imports = [ flakelight.flakelightModules.extendFlakelight ];
      templates = import ./templates;
      flakelightModule = { lib, ... }: {
        imports = [
          ./flakelight-darwin/darwinModules.nix
          ./flakelight-darwin/darwinConfigurations.nix
        ];
        inputs.nix-darwin = lib.mkDefault nix-darwin;
        systems = lib.mkDefault [ "aarch64-darwin" ];
      };

      outputs.tests = import ./tests inputs;
    };
}
