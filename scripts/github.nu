#!/usr/bin/env nu

let dir = (tmux display-message -p '#{pane_current_path}' | str trim)
cd $dir

if ((try { git rev-parse --git-dir | ignore; true } catch { false }) == false) {
  tmux display-message "Not in a git repository"
}

let url = (try { git remote get-url origin | str trim } catch { "" })

if $url == "" {
  tmux display-message "No origin remote found"
}

let web_url = (if ($url | str starts-with "git@github.com:") {
  $url
  | str replace 'git@github.com:' 'https://github.com/'
  | str replace --regex '\.git$' ''
} else if ($url | str starts-with "https://github.com/") {
  $url | str replace --regex '\.git$' ''
} else {
  $url
})


if ($web_url | str contains "github.com") {
  if (($nu.os-info | get name) == "macos") {
    open $web_url  
  } else {
    xdg-open $web_url
  }

  tmux display-message "Opened GitHub repository in browser"
} else {
  tmux display-message "This repository is not hosted on GitHub"
}