# Edit this configuration file to define what unstable packages should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

let
  unstableTarball =
    fetchTarball  {
      url ="https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    };  
in

{
  # Allow unstable packages
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
        };
      };
    };

  environment.systemPackages = with pkgs; [

    unstable.appimage-run
    unstable.darktable
    unstable.digikam
    unstable.distrobox
    unstable.filezilla
    unstable.kitty
    unstable.kitty-img
    unstable.obs-studio
    unstable.obs-studio-plugins.wlrobs
    unstable.spotube
   ];
 }  
