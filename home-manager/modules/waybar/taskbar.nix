{
  programs.waybar.settings.taskbar = {
    modules-center = [
      "wlr/taskbar"
    ];

    "wlr/taskbar" = {
      icon-size = 24;
      on-click = "activate";
      tooltip = false;
    };

    height = 48;
    margin = "0 5 5 5";
    position = "bottom";
  };
}
