{
  layerrule = [
    "noanim, rofi"
    "blur, rofi"
  ];

  windowrulev2 = [
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    "suppressevent maximize, class:.*"
    "opacity 0.5 0.5, title:^(ghostty)$"
  ];
}
