{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ./setupuser.nix
    ./auto-update.nix
  ]

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      auto-optimise-store = true;
    };
  };

  system.autoUpgrade.enable = true;

  nixpkgs.config.allowUnfree = true;

	users.mutableUsers = false;
	users.users.root = {
		#hashedPassword = "*";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlNjqatBMaUoLBKV+fV9lAI1NxZU0kUO5c1ybIoLcszJNnEMoWpj8dokkBYQ43J2SlWfF3RWDZK7hhoPc+V2VnUF9TqEcv9XUceCjtuzSuHA4qyAMgb/RzKZDKQ1DNLlNdLVVVD/DDHmBPKBkaU3ab9KosvUayPEceUOA9O9dHJvbJzb0cEsOt67yhF4GMlGC+xcWOeHgPVtuRodWvmgWRsuUIJCLX41xmjO3jkwSEoy0qyJ6QWFBEP6jET8T2rl8F5MUOBviNHVqjlbzoymSkmvIXCNJLjcL9HewShwMGGVLZfd9/Hnvb/zLuLR1ZjvGkTt+0SdKbw4ixC4sy9hFXPG91t0TSlmnxu6H1NWGPb86BRdcgJSJEgZBKmxMFdV4frQKrGRCvQaVSITzFkw0jtYjuDQQTCCPjE+ZDjzeXpIqavFOzfDPW+5ANVHa46UajiIHMihLYPC/TsqI6BEoxgUvBOO/rtLeMA47bSmztuQ1t24XKxGILqEI24GQwjRk= cthtrifork@github/73858590"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCehLsJ1WZbHB147wgvTdtNftmG/6ynVNEODso3V9Q2dwncP8lYaNMZvmJeoFuU503qU84b5lRK797tFJ8TU5AqVmZGXZZVlIlLGP/FGey5t4sFNnXpRjfz/9eWMiKJDjs5XN7o5h1f/0WexAqm5fv6cjfbK28LkZja9S7t9fF5yJOQe4KfuXY6tjtj1nOoOKrYaMXa9NieiUc9iCIVy2mniUy14yvsY2M4uLz9Yo+N6G3G5zf6mh+IhIKzzvN+lY1nC/gxWXpoqwyEI349iFxHwwfZS3u+B+eJax71T2ceMLGBfOgw7w96tLw14Unfvaw0gcd8POwEGGJMEoQ83s/NKcuxUAyKZ8iJLq5E+qa+Mnp3Gz5otNmzAu46oxyAFsn2li9kvVpEzkgXecOnA64cMymxMVGiIjMU4wfTIqGMvl2DumN2/LaHlxXf7xfuD4AuHGhYQcgAe58lQtWFNILkIgWW/9CUMQeiX4vFIXQAFqD32S3cYE71uohLR8q9DPRideXjCeUatfltG9QGuqqeT85k3YQdUv6rvBdCm0SG56L/6FuSd+TtjfZWSA/8FcSzsFHXBmJs8KXj/SKqGDG18t/4lEooAQdhUX+IMxWeXOcrLU2AHa7SugfM7NNcf2Y08fGtg+51Q9CRQR/o2gaBpfo5BSm3sXGsmdgmwetzUw== cthtrifork@github/83500632"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIO6lC/ygAhNiAQ2LGQa9EsOPSEVao2Yb26ZdFrAoldH3lqlV8eo1HYGbVcupBL42IcB6JgVTzd+3zbDs6/bMLPzXdp1MFnKm6zAT4WslibN8JSrsEh++8CA5nuqEtup3QB/GuLMRRZab7cparrAXLEWNG/fRkydTxiEtWM7ZbRANm3jb2rEmpRyxFq8+3hqtqJbSks43nZ9w/2Ej/Zwd65M3NmQE/zl4nkdw/hBqHUgdVZh+7SVgXn+HNtp52XeRG092PcSfMUQtgvjRLXymY4uvkR0SgtFG2k5IddWnckE/Q6X02H7AHnIGPXGiI/v1R4pb+OupPMBQrUp8aXfIhMU3YKSL6jsb5xBOgXxyCfz2Kl2EzMf1o/a1Q5Yzc4bl/fDvKOmlF+kxnsojsR2ZNANu/FLm2xGuGcDWLLAkABqIi0Df5UymmLLgQaPtcUMAVhAtN6UyjgSCVuVnY9N6RJ7+YgsKqXoeDca5jz8+2StjDu0n+SDYlIkMvprdEYjcI3YNe/mBRkAVjjAxOzhJxQj/bZ6/R0kBNxp46yokDcZkWIscUwSFDN+kck3CjTxkjD71yPLzZLXGUMphnUCOF8i6H0a+qi3ZhIJeBAX8OkPByhW+qZsJXhlGzygiq/HktlHcdk+5LaqH0VjnL37cuLaTBET7VLrARdOgaFrYHhw== cthtrifork@github/109003985"
    ];
	};
  
  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";
  #time.timeZone = "America/Los_Angeles";

  # Define a user account.
  users.users.caspertdk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "systemd-journal" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlNjqatBMaUoLBKV+fV9lAI1NxZU0kUO5c1ybIoLcszJNnEMoWpj8dokkBYQ43J2SlWfF3RWDZK7hhoPc+V2VnUF9TqEcv9XUceCjtuzSuHA4qyAMgb/RzKZDKQ1DNLlNdLVVVD/DDHmBPKBkaU3ab9KosvUayPEceUOA9O9dHJvbJzb0cEsOt67yhF4GMlGC+xcWOeHgPVtuRodWvmgWRsuUIJCLX41xmjO3jkwSEoy0qyJ6QWFBEP6jET8T2rl8F5MUOBviNHVqjlbzoymSkmvIXCNJLjcL9HewShwMGGVLZfd9/Hnvb/zLuLR1ZjvGkTt+0SdKbw4ixC4sy9hFXPG91t0TSlmnxu6H1NWGPb86BRdcgJSJEgZBKmxMFdV4frQKrGRCvQaVSITzFkw0jtYjuDQQTCCPjE+ZDjzeXpIqavFOzfDPW+5ANVHa46UajiIHMihLYPC/TsqI6BEoxgUvBOO/rtLeMA47bSmztuQ1t24XKxGILqEI24GQwjRk= cthtrifork@github/73858590"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCehLsJ1WZbHB147wgvTdtNftmG/6ynVNEODso3V9Q2dwncP8lYaNMZvmJeoFuU503qU84b5lRK797tFJ8TU5AqVmZGXZZVlIlLGP/FGey5t4sFNnXpRjfz/9eWMiKJDjs5XN7o5h1f/0WexAqm5fv6cjfbK28LkZja9S7t9fF5yJOQe4KfuXY6tjtj1nOoOKrYaMXa9NieiUc9iCIVy2mniUy14yvsY2M4uLz9Yo+N6G3G5zf6mh+IhIKzzvN+lY1nC/gxWXpoqwyEI349iFxHwwfZS3u+B+eJax71T2ceMLGBfOgw7w96tLw14Unfvaw0gcd8POwEGGJMEoQ83s/NKcuxUAyKZ8iJLq5E+qa+Mnp3Gz5otNmzAu46oxyAFsn2li9kvVpEzkgXecOnA64cMymxMVGiIjMU4wfTIqGMvl2DumN2/LaHlxXf7xfuD4AuHGhYQcgAe58lQtWFNILkIgWW/9CUMQeiX4vFIXQAFqD32S3cYE71uohLR8q9DPRideXjCeUatfltG9QGuqqeT85k3YQdUv6rvBdCm0SG56L/6FuSd+TtjfZWSA/8FcSzsFHXBmJs8KXj/SKqGDG18t/4lEooAQdhUX+IMxWeXOcrLU2AHa7SugfM7NNcf2Y08fGtg+51Q9CRQR/o2gaBpfo5BSm3sXGsmdgmwetzUw== cthtrifork@github/83500632"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIO6lC/ygAhNiAQ2LGQa9EsOPSEVao2Yb26ZdFrAoldH3lqlV8eo1HYGbVcupBL42IcB6JgVTzd+3zbDs6/bMLPzXdp1MFnKm6zAT4WslibN8JSrsEh++8CA5nuqEtup3QB/GuLMRRZab7cparrAXLEWNG/fRkydTxiEtWM7ZbRANm3jb2rEmpRyxFq8+3hqtqJbSks43nZ9w/2Ej/Zwd65M3NmQE/zl4nkdw/hBqHUgdVZh+7SVgXn+HNtp52XeRG092PcSfMUQtgvjRLXymY4uvkR0SgtFG2k5IddWnckE/Q6X02H7AHnIGPXGiI/v1R4pb+OupPMBQrUp8aXfIhMU3YKSL6jsb5xBOgXxyCfz2Kl2EzMf1o/a1Q5Yzc4bl/fDvKOmlF+kxnsojsR2ZNANu/FLm2xGuGcDWLLAkABqIi0Df5UymmLLgQaPtcUMAVhAtN6UyjgSCVuVnY9N6RJ7+YgsKqXoeDca5jz8+2StjDu0n+SDYlIkMvprdEYjcI3YNe/mBRkAVjjAxOzhJxQj/bZ6/R0kBNxp46yokDcZkWIscUwSFDN+kck3CjTxkjD71yPLzZLXGUMphnUCOF8i6H0a+qi3ZhIJeBAX8OkPByhW+qZsJXhlGzygiq/HktlHcdk+5LaqH0VjnL37cuLaTBET7VLrARdOgaFrYHhw== cthtrifork@github/109003985"
    ];
    #hashedPassword = "${HASHED_PASSWORD}";
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
  networking.hostName = "nixos";

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
