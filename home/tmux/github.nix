{
  home.file.".config/tmux/github.sh" = {
    text = ''
      #!/usr/bin/env bash

      dir=$(tmux run "echo #{pane_start_path}")
      cd $dir
      url=$(git remote get-url origin)

      if [[ $url == *"github.com"* ]]; then
        open $url
      else
        echo "This repository is not hosted on GitHub"
      fi
    '';
    executable = true;
  };
}
