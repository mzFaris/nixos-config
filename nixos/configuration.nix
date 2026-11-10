{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-e124ef31-622e-4ecb-a501-bcfa18416620".device =
    "/dev/disk/by-uuid/e124ef31-622e-4ecb-a501-bcfa18416620";
  networking.hostName = "uzi"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."fr" = {
    isNormalUser = true;
    description = "fr";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = false;

    flatpak = {
      enable = true;

      update.auto = {
        enable = true;
        onCalendar = "daily";
      };

      packages = [
        "net.donnybeelo.Convey"
        "com.brave.Browser"
        "io.github.focustimerhq.FocusTimer"
        "org.gnome.baobab"
        "org.gnome.Calculator"
        "org.gnome.Calendar"
        "org.gnome.Characters"
        "org.gnome.clocks"
        "org.gnome.Decibels"
        "org.gnome.font-viewer"
        "org.gnome.Loupe"
        "org.gnome.Music"
        "org.gnome.Papers"
        "org.gnome.Showtime"
        "org.gnome.Snapshot"
        "org.gnome.TextEditor"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    gnome-system-monitor
    nautilus
    gnome-disk-utility
  ];

  system.stateVersion = "26.05"; # Did you read the comment?
}
