# Edit this configuration file to define what unstable packages should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ upkgs, ... }:

{ environment.systemPackages = with upkgs; [

    #adw-gtk3
    #darktable
    #digikam
    #exiftool
    #filezilla
    #ffmpeg-full
    #fractal
    #gnomeExtensions.logo-menu
    #insync
    #localsend
    #nextcloud-client
    ptyxis
    quickgui
    quickemu
    spotube
   ];
 }  
