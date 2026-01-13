{ config, pkgs, lib, ... }:

let
  # Import unstable for the latest jellyfin-desktop
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    config = { allowUnfree = true; };
  };

  # Verified NixOS Wiki fix for HDMI-CEC on Raspberry Pi
  libcec-rpi = pkgs.libcec.override { withLibraspberrypi = true; };
in
{
  imports = [ ./hardware-configuration.nix ];

  # 1. Hardware & Bootloader (Standard RPi4 settings)
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;

  # Required firmware and hardware overlays
  hardware.enableRedistributableFirmware = true;
  hardware.raspberry-pi."4".apply-overlays-dtmerge.enable = true;
  hardware.graphics.enable = true;

  # 2. Networking (WiFi & SSH)
  networking.hostName = "jellyfin-kiosk";
  networking.wireless = {
    enable = true;
    networks."DEVICES24".psk = "PASS1WORD001";
  };
  services.openssh.enable = true;

  # 3. Audio (HDMI)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # 4. HDMI-CEC Verification (Wiki Specifics)
  # We add /dev/vchiq to udev rules as per the NixOS wiki for Pi CEC support
  services.udev.extraRules = ''
    KERNEL=="cec*", GROUP="video", MODE="0660"
    KERNEL=="vchiq", GROUP="video", MODE="0660", TAG+="systemd", ENV{SYSTEMD_ALIAS}="/dev/vchiq"
  '';

  # 5. Kiosk Mode (Cage + Jellyfin Desktop)
  services.cage = {
    enable = true;
    user = "kiosk";
    program = "${unstable.jellyfin-desktop}/bin/jellyfin-desktop --fullscreen";
  };


  # 7. User and Permissions
  users.users.kiosk = {
    isNormalUser = true;
    extraGroups = [ "video" "audio" "render" "wheel" ];
    initialPassword = "Pass1word001";
  };

  # 8. System Packages
  environment.systemPackages = with pkgs; [
    libcec-rpi # Using our RPi-enabled version of libcec
    unstable.jellyfin-desktop
    htop
  ];

  system.stateVersion = "26.05";
}
