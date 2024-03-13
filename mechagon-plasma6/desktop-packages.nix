# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Gnome desktop

{
  environment.systemPackages = with pkgs; [
    blackbox-terminal
    (catppuccin-gtk.override {
      accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      tweaks = [ "normal" ]; # You can also specify multiple tweaks here
      variant = "mocha";
    })
    (catppuccin-kde.override {
      accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
      winDecStyles = [ "modern" ];
      flavour = [ "mocha" ];
    })
    catppuccin-kvantum
    catppuccin-sddm-corners
    chromium
    darktable
    digikam
    distrobox
    discord
    filezilla
    firefox
    gimp
    inkscape
    kdePackages.dragon
    kdePackages.kdenlive
    kdePackages.tokodon
    libsForQt5.polonium
    meld
    obs-studio
    obs-studio-plugins.wlrobs
    ocs-url
    papirus-icon-theme
    qbittorrent
    rapid-photo-downloader
    slstatus
    spotube
    sublime4
    syncthingtray
    telegram-desktop
    # tokyo-night-gtk
    trayscale
    wl-clipboard
];
}
