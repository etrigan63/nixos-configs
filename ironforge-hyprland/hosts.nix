{ config, pkgs, ... }:

{ networking.extraHosts = 
''  
    127.0.0.1 localhost     #example
  '';
}