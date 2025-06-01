# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# never put virtualbox,mlocate in this list

{
  environment.systemPackages = with pkgs; [
    #ckb-next
    #google-chrome
    #wpsoffice
    #alacritty
    #arandr
    #arc-theme
    avahi
    baobab
    bash-completion
    bat
    #betterdiscordctl
    #bibata-cursors
    #blueberry
    btop
    #chromium
    curl
    #desktop-file-utils
    #dex
    #discord
    #dmenu
    #dropbox
    duf
    edid-decode
    #etcher
    #evince
    #feh
    #filezilla
    #firefox
    fish
    fishPlugins.tide
    #font-manager
    fsearch
    #gimp
    git
    gitui
    #gnome.dconf-editor
    #gnome.gnome-disk-utility
    #gnome.gvfs
    #hack-font
    #hblock
    hw-probe
    hwinfo
    #i3lock-fancy
    #inkscape
    #insync
    inxi
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    killall
    #kitty
    libsecret
    lm_sensors
    lshw
    lunarvim
    #meld
    most
    fastfetch
    #neovim
    (nerdfonts.override { fonts = [ "RobotoMono"]; })
    #networkmanagerapplet
    nixos-generators
    (nnn.override { withNerdIcons = true; })
    nodejs
    nodePackages_latest.npm
    #nomacs
    #ocl-icd
    #obs-studio
    #ookla-speedtest
    #qbittorrent-qt5
    procps
    python3
    python311Packages.pynvim
    #qt6Packages.qtstyleplugin-kvantum
    #rapid-photo-downloader
    ripgrep
    #scrot
    #sddm-chili-theme
    #simplescreenrecorder
    #spotify
    #telegram-desktop
    #thunderbird
    tree
    unzip
    #variety
    #vlc
    #volumeicon
    #vscode
    wget
    #widevine-cdm
    #xorg.xkill
    zig
    #zsh
    #zsh-completions
    #zsh-syntax-highlighting
  ];
}
