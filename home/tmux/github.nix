{
  home.file.".config/tmux/github.sh" = {
    text = ''
      #!/usr/bin/env bash

      dir=$(tmux display-message -p '#{pane_current_path}')
      cd "$dir"

      if ! git rev-parse --git-dir > /dev/null 2>&1; then
        tmux display-message "Not in a git repository"
        exit 1
      fi

      url=$(git remote get-url origin 2>/dev/null)

      if [[ -z "$url" ]]; then
        tmux display-message "No origin remote found"
        exit 1
      fi

      if [[ $url == git@github.com:* ]]; then
        url=$(echo "$url" | sed 's/git@github.com:/https:\/\/github.com\//' | sed 's/\.git$//')
      elif [[ $url == https://github.com/* ]]; then
        url=$(echo "$url" | sed 's/\.git$//')
      fi

      if [[ $url == *"github.com"* ]]; then
        xdg-open "$url"
      else
        tmux display-message "This repository is not hosted on GitHub"
      fi
    '';
    executable = true;
  };
}
