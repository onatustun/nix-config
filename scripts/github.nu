#!/usr/bin/env nu

let dir = tmux display-message -p '#{pane_current_path}' | str trim
cd $dir

if (git rev-parse --git-dir | complete).exit_code != 0 {
  tmux display-message "Not in a git repository"
  exit 1
}

let url = try {
  git remote get-url origin | str trim
} catch {
  tmux display-message "No origin remote found"
  exit 1
}

let web_url = $url
  | str replace --regex '^git@github.com:' 'https://github.com/'
  | str replace --regex '\.git$' ''

if not ($web_url | str contains "github.com") {
  tmux display-message "This repository is not hosted on GitHub"
  exit 1
}

let open_cmd = match ($nu.os-info | get name) {
  "macos" => "open",
  "windows" => "start",
  _ => "xdg-open"
}

^$open_cmd $web_url
tmux display-message "Opened GitHub repository in browser"