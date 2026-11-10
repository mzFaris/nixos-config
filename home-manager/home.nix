{ pkgs, ... }:

let
  mkLanguageList =
    names:
    map (name: {
      inherit name;
      auto-format = true;
    }) names;
in
{
  news.display = "silent";

  home = {
    username = "fr";
    homeDirectory = "/home/fr";
    stateVersion = "26.05"; # Please read the comment before changing.

    packages = with pkgs; [
      wget2
      tinymist
      nil
    ];
  };

  programs = {
    uv.enable = true;
    opencode.enable = true;
    ty.enable = true;
    fastfetch.enable = true;
    zoxide.enable = true;
    home-manager.enable = true;

    helix = {
      enable = true;

      settings = {
        theme = "catppuccin_mocha";
        editor = {
          cursor-shape.insert = "bar";
          line-number = "relative";
        };
      };

      languages.language = mkLanguageList [
        "typst"
        "nix"
        "python"
      ];
    };

    nh = {
      enable = true;
      clean.enable = true;
    };

    fish = {
      enable = true;
      functions.fish_greeting = "";
    };

    ghostty = {
      enable = true;
      settings.command = "fish";
    };

    git = {
      enable = true;

      settings = {
        init.defaultBranch = "main";

        user = {
          name = "Mirza Faris Al Arifin";
          email = "mirzafarisalarifin0@gmail.com";
        };
      };
    };

    yt-dlp = {
      enable = true;
      settings.parse-metadata = "playlist_index:%(track_number)s";
    };
  };
}
