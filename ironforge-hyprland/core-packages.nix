# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
    avahi
    baobab
    bash-completion
    bat
    betterdiscordctl
    bibata-cursors
    blueberry
    btop
    #chromium
    curl
    desktop-file-utils
    dex
    discord
    #dmenu
    #dropbox
    duf
    edid-decode
    #etcher
    evince
    fastfetch
    ffmpeg_7-full
    filezilla
    firefox
    fish
    fishPlugins.tide
    font-manager
    fsearch
    gimp
    git
    gitui
    gnome.dconf-editor
    gnome.gnome-disk-utility
    gnome.gnome-keyring
    gnome.gvfs
    gnome.libgnome-keyring
    gnome.seahorse
    #hack-font
    hblock
    hw-probe
    hwinfo
    #i3lock-fancy
    inkscape
    #insync
    inxi
    jq
    killall
    #kitty
    libsecret
    lm_sensors
    lshw
    lunarvim
    meld
    most
    #neovim
    nerdfonts
    networkmanagerapplet
    nixos-generators
    (nnn.override { withNerdIcons = true; })
    nvme-cli
    ookla-speedtest
    qbittorrent-qt5
    popsicle
    procps
    python3
    python311Packages.sparklines
    qt6Packages.qtstyleplugin-kvantum
    rapid-photo-downloader
    ripgrep
    scrot
    #simplescreenrecorder
    swtpm
    tree
    unzip
    usbutils
    wget
    widevine-cdm
    xcur2png
    xorg.libxcb
    zig
  ];
}
