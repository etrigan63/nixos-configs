# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Gnome desktop

{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    amberol
    betterdiscordctl
    # blackbox-terminal
    (catppuccin.override {
       accent = "blue";
       variant = "mocha";
       themeList = [ "bat" "btop" "kvantum" ];
    })
    (catppuccin-gtk.override {
      accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      tweaks = [ "normal" ]; # You can also specify multiple tweaks here
      variant = "mocha";
    })
    catppuccin-kvantum
    chromium
    darktable
    digikam
    discord
    exiftool
    ffmpeg_7-full
    filezilla
    firefox
    fractal
    fragments
    gimp
    gimpPlugins.gimplensfun
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.logo-menu
    gradience
    insync
    insync-nautilus
    lensfun
    localsend
    meld
    nextcloud-client
    obs-studio
    obs-studio-plugins.wlrobs
    ocs-url
    orca-slicer
    papirus-icon-theme
    popsicle
    qownnotes
    rapid-photo-downloader
    rpi-imager
    telegram-desktop
    thunderbird
    # variety
    ventoy
    # wavebox
    #wezterm
    wl-clipboard
    yt-dlp
];
}
