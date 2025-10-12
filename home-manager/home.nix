{ inputs, pkgs, ... }:
{
  imports = [
    ./modules
  ];

  home = {
    username = "evren";
    homeDirectory = "/home/evren";
  };

  home.packages = with pkgs; [
    btop
    alacritty
    tofi
    waybar
    mako

    firefox
    vesktop
    cloudflare-warp
    spotify
    prismlauncher


    vscode
    python3
    gh

    _1password
    _1password-gui

    # fonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];


  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "evren" ];
  };


  # waybar config
  packages.waybar.enable = true;

  
  # alacritty config
  packages.alacritty = {
    enable = true;
    settings = {
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      general.import = [ "${pkgs.alacritty-theme}/nightfox.toml" ];
      window.opacity = 0.8;
    }; 
  };

  # Mouse stuff
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
      };
      gtk3.extraConfig = {
        "gtk-cursor-theme-name" = "Bibata-Modern-Classic";
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-cursor-theme-name=Bibata-Modern-Classic
        '';
      };
    };


  home.stateVersion = "25.05";

}
