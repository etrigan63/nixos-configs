# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
    avahi
    bat
    bibata-cursors
    btop
    cava
    curl
    dconf
    desktop-file-utils
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
    gtop
    #hack-font
    hblock
    hw-probe
    hwinfo
    imlib2
    inxi
    killall
    libnotify
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libva-utils
    #linuxKernel.packages.linux_6_8.vmware
    lm_sensors
    lshw
    lunarvim
    most
    nixos-generators
    nmap
    (nnn.override { withNerdIcons = true; })
    nvme-cli
    ookla-speedtest
    procps
    python3
    python311Packages.sparklines
    qt6Packages.qtstyleplugin-kvantum
    ripgrep
    #simplescreenrecorder
    swtpm
    tree
    unzip
    usbutils
    webkitgtk
    wget
    wireplumber
    #xorg.xkill
  ];
}
