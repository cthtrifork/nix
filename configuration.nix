{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./setupuser.nix
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" "repl-flake" ];
  };

  system.autoUpgrade.enable = true;

	users.mutableUsers = false;
	users.users.root = {
		hashedPassword = "*";
	};
  
  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";
  #time.timeZone = "America/Los_Angeles";

  # Define a user account.
  users.users.caspertdk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "systemd-journal" ];
    shell = pkgs.zsh;
    hashedPassword = "${HASHED_PASSWORD}";
    #packages = with pkgs; [];
  };

  security.sudo.wheelNeedsPassword = false;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];

  programs = { 
	 	zsh = {
			enable = true;
			autosuggestions.enable = true;
			zsh-autoenv.enable = false;
			syntaxHighlighting.enable = true;
	 };
    # needed for vscode remote ssh
    nix-ld.enable = true; 
  };

  # Use systemd-boot
  boot.loader.systemd-boot.enable = true;

  # disable ipv6
  networking.enableIPv6  = false;
  networking.hostName = "nixos-homeserver";

  # Select internationalisation properties.
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  i18n.defaultLocale = "en_US.UTF-8";
  environment.variables = {
    TZ = config.time.timeZone;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bash
    cloud-init
    coreutils
    curl
    docker
    docker-buildx
    docker-compose
    eza
    findutils
    fzf
    git
    gnumake
    gnutar
    htop
    iproute2
    jq
    killall
    less
    libuuid
    linuxHeaders
    mkpasswd
    netcat
    nettools
    nmap
    openssl
    python3
    python3Packages.pip
    ripgrep
    rsync
    spice-vdagent
    ssh-import-id
    strace
    sysstat
    tealdeer
    tree
    tzdata
    unzip
    util-linux
    wget
    yq
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  #services.cloud-init.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      #X11Forwarding = true;
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = false; # disable password login
    };
    #openFirewall = true;
  };
  services.qemuGuest.enable = true;
  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
}
