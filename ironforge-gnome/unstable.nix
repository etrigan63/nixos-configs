# Edit this configuration file to define what unstable packages should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
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

    unstable.darktable
    unstable.digikam
    unstable.ffmpeg-full
    unstable.fractal
    unstable.insync
    unstable.nextcloud-client
    unstable.spotube
    unstable.sublime4
   ];
 }  
