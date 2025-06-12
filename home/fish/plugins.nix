{ 
  pkgs,
  ...
}: with pkgs.fishPlugins; [
  {
    name = "autopair";
    src = autopair.src;
  }
  {
    name = "done";
    src = done.src;
  }
  {
    name = "fish-you-should-use";
    src = fish-you-should-use.src;
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
  {
    name = "puffer";
    src = puffer.src;
  }
  {
    name = "sponge";
    src = sponge.src;
  }
]
