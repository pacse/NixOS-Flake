{
  programs.waybar.settings.taskbar = {
    modules-center = [
      "wlr/taskbar"
    ];

    "wlr/taskbar" = {
      icon-size = 24;
      on-click = "minimize-raise";
    };

    height = 48;
    margin = "0 5 5 5";
    position = "bottom";
  };
}
