# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Hyprland desktop

{
  environment.systemPackages = with pkgs; [
    #obs-studio-plugins.wlrobs
    adw-gtk3
    amberol
    #blackbox-terminal
    btop
    (catppuccin-gtk.override {
      accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      tweaks = [ "normal" ]; # You can also specify multiple tweaks here
      variant = "mocha";
    })
    catppuccin-kvantum
    cava
    chromium
    #dash
    #eww
    #feh
    #font-awesome
    fuzzel
    glib
    gnome.file-roller
    gnumake
    gradience
    grim
    grimblast
    gsettings-desktop-schemas
    hyprcursor
    imlib2
    libnotify
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    micro
    ocs-url
    papirus-icon-theme
    pamixer
    pavucontrol
    python311Packages.sparklines
    rofi
    slstatus
    slurp
    swaybg
    swayidle
    swayimg
    swaylock
    swaynotificationcenter
    syncthingtray
    #tokyo-night-gtk
    trayscale
    waybar
    wdisplays
    wl-clipboard
    wofi
    wttrbar
    xfce.ristretto
    xfce.thunar
    xfce.thunar-archive-plugin
    #xorg.libX11.dev
    #xorg.libXft
    #xorg.libXinerama
    yad
];
}
