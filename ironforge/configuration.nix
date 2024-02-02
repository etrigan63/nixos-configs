# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# https://releases.nixos.org/nixos/unstable/

{ config, pkgs, ... }:

#let
#  unstableTarball =
#    fetchTarball
#      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
#in

{
  # Allow unfree packages
#  nixpkgs.config = {
#    allowUnfree = true;
#    packageOverrides = pkgs: {
#      unstable = import unstableTarball {
#        config = config.nixpkgs.config;
#        };
#      };
#    };

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./core-packages.nix
      ./desktop-packages.nix
      #./samba.nix
      ./env-vars.nix
      ./unstable.nix
      #./virtualbox.nix
      ./desktops/hyprland.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable fonts
  fonts.packages = with pkgs; [
    nerdfonts
    hack-font
    jetbrains-mono
    font-awesome
    roboto
    roboto-slab
  ];  

  # Swappiness
  boot.kernel.sysctl = { "vm.swappiness" = 10;};

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["amdgpu.sg_display=0"];

  networking.hostName = "mechagon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable tailscale
  services.tailscale.enable = true;

  # Enable flatpaks
  services.flatpak.enable = true;

  # Enable syncthing
  services = {
    syncthing = {
        enable = true;
        user = "guru";
        dataDir = "/home/guru/Sync";    # Default folder for new synced folders
        configDir = "/home/guru/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};
  # Disabling X11 - go for startx
  #services.xserver.autorun = false;
  #services.xserver.displayManager.startx.enable = true;

  # Enable OpenCL and Vulkan
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm = {
	enable = true;
	theme = "chili";
  };
  # services.xserver.desktopManager.plasma5.enable = true;
  # for wayland dark theme  
  programs.dconf = {
     enable = true;
     profiles.user.databases = [
       {
         settings."org/gnome/desktop/interface" = {
           gtk-theme = "Catppuccin-Mocha-Standard-Blue-Dark";
           icon-theme = "Papirus-Dark";
           cursor-theme = "Bibata-Modern-ice";
           font-name = "Roboto 12";
           monospace-font-name = "RobotoMono Nerd Font";
           document-font-name = "Roboto 12";
         };
       }
     ];
  };

  environment.etc = {
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-cursor-theme-name=Bibata-Modern-ice
      gtk-font-name=Roboto 12
      gtk-icon-theme-name=Papirus-Dark
      gtk-theme-name=Catppuccin-Mocha-Standard-Blue-Dark
    '';
    # qt compat mode is gtk2 based.
    "xdg/gtk-2.0/gtkrc".text = ''
      gtk-theme-name = "Catppuccin-Mocha-Standard-Blue-Dark"
    '';
  };
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "qt5ct";
  };
  
  nixpkgs.config.qt5 = {
  enable = true;
  platformTheme = "qt5ct"; 
    style = {
      package = pkgs.catppuccin-kvantum;
      name = "Catppuccin-Mocha-Blue";
    };
  };

  # Run unpatched dynamic binaries
  # programs.nix-ld.enable = true;

  # https://mynixos.com/options/services.xserver.desktopManager
  
  #services.xserver.desktopManager.budgie
  #services.xserver.desktopManager.cde
  #services.xserver.desktopManager.cinnamon
  #services.xserver.desktopManager.deepin
  #services.xserver.desktopManager.enlightenment
  #services.xserver.desktopManager.gnome
  #services.xserver.desktopManager.kodi
  #services.xserver.desktopManager.lumina
  #services.xserver.desktopManager.lxqt
  #services.xserver.desktopManager.mate
  #services.xserver.desktopManager.pantheon
  #services.xserver.desktopManager.phosh
  #services.xserver.desktopManager.plasma
  #services.xserver.desktopManager.retroarch
  #services.xserver.desktopManager.surf-display
  #services.xserver.desktopManager.wallpaper
  #services.xserver.desktopManager.xfce
  #services.xserver.desktopManager.xterm

  #https://mynixos.com/options/services.xserver.windowManager

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    libinput.touchpad.disableWhileTyping = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [pkgs.hplipWithPlugin];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.guru = {
    isNormalUser = true;
    description = "Carlos Echenique";
    shell = pkgs.fish;
    extraGroups = [ "mlocate" "networkmanager" "wheel" "samba" "vboxusers" ];
    packages = with pkgs; [
      firefox
    ];
  };

  # Enable swaylock to authenticate
  security.pam.services.swaylock = {};
  # Enable automatic login for the user.
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "erik";

  # nixpkgs.config.nvidia.acceptLicense = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  # Auto system update
  system.autoUpgrade = {
      enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  # Disable the x11-askPass that messes up terminal authentication
  programs.ssh.askPassword = "";

  # List services that you want to enable:

  services.locate = {
    enable = true;
    interval = "hourly";
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    #nssmdns4 = true;
    ipv4 = true;
    ipv6 = true;
    publish = {
      enable = true;
      workstation = true;
  	};
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };

  programs.fish = {
    enable = true;
  };

  #programs.steam.enable =  true;

  # Dbus
  services.dbus.enable = true;

  # for wayland dark theme  
  #programs.dconf.enable = true;

  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Gvfs
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Automatic garbage collection of old generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
 
  nixpkgs.config.permittedInsecurePackages = [
	 "openssl-1.1.1w" "electron-19.1.9"
  ];
}
