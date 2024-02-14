# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Gnome desktop

{
  environment.systemPackages = with pkgs; [
    amberol
    blackbox-terminal
    (catppuccin-gtk.override {
      accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      tweaks = [ "normal" ]; # You can also specify multiple tweaks here
      variant = "mocha";
    })
    catppuccin-kvantum
    celluloid
    chromium
    discord
    filezilla
    firefox
    fragments
    gimp
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.paperwm
    hplip
    inkscape
    meld
    obs-studio
    obs-studio-plugins.wlrobs
    ocs-url
    papirus-icon-theme
    qbittorrent-qt5
    rapid-photo-downloader
    slstatus
    syncthingtray
    telegram-desktop
    thunderbird
    # tokyo-night-gtk
    trayscale
    variety
    wl-clipboard
];
}
