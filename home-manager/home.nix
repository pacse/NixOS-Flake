{pkgs, ...}: {
  home = {
    username = "evren";
    homeDirectory = "/home/evren";
  };

  home.packages = with pkgs; [
    gh
    btop
    alacritty
    tofi
    firefox
    waybar
    vesktop
    cloudflare-warp
    vscode
    spotify
    prismlauncher
    _1password
    _1password-gui
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod,Space,exec, tofi-drun | xargs hyprctl dispatch exec --"
      ];
    };
  };

#  programs._1password-gui = {
#    enable = true;
#    polkitPolicyOwners = [ "evren" ];
#  };

  # enable waybar
  packages.waybar.enable = true;

  home.stateVersion = "25.05";

}
