# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Hyprland desktop

{
  environment.systemPackages = with pkgs; [
    amberol
    betterdiscordctl
    #blackbox-terminal
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
    firefox
    fragments
    fuzzel
    gimp
    gimpPlugins.gimplensfun
    gnome.dconf-editor
    gnome.file-roller
    gnome.gvfs
    inkscape
    lensfun
    mako
    meld
    obs-studio
    obs-studio-plugins.wlrobs
    ocs-url
    papirus-icon-theme
    pavucontrol
    popsicle
    rapid-photo-downloader
    # slstatus
    # syncthingtray
    telegram-desktop
    thunderbird
    # tokyo-night-gtk
    # trayscale
    # variety
    ventoy
    waybar
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    yt-dlp
];
}
