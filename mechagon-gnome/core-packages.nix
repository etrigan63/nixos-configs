# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
    avahi
    bat
    betterdiscordctl
    bibata-cursors
    bottom
    cava
    curl
    desktop-file-utils
    #dropbox
    duf
    edid-decode
    #etcher
    evince
    fastfetch
    fish
    fishPlugins.tide
    fsearch
    git
    gitui
    glib
    gnumake
    #hack-font
    hblock
    hw-probe
    hwinfo
    imlib2
    #insync
    inxi
    killall
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    lm_sensors
    lshw
    lunarvim
    most
    nixos-generators
    (nnn.override { withNerdIcons = true; })
    ookla-speedtest
    procps
    python3
    python311Packages.sparklines
    qt6Packages.qtstyleplugin-kvantum
    ripgrep
    #simplescreenrecorder
    tree
    unzip
    wget
    wireplumber
    xorg.xkill
  ];
}
