# Edit this configuration file to define what unstable packages should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ upkgs, ... }:

{ environment.systemPackages = with upkgs; [

    darktable
    digikam
    insync
    nextcloud-client
    nwg-drawer
    ptyxis
    quickgui
    quickemu
    spotube
   ];
 }  
