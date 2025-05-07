{ 
  pkgs,
  ...
}: with pkgs.fishPlugins; [
  {
    name = "autopair";
    src = autopair.src;
  }
  {
    name = "fzf-fish";
    src = fzf-fish.src;
  }
  {
    name = "plugin-git";
    src = plugin-git.src;
  }
  {
    name = "plugin-sudope";
    src = plugin-sudope.src;
  }
]
