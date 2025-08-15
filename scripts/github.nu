#!/usr/bin/env -S nu

let dir = (
  ^tmux display-message -p '#{pane_current_path}' | str trim
)

if ($dir | is-empty) {
  ^tmux display-message "Could not determine pane path"
  exit 1
}

cd $dir

^git rev-parse --git-dir out> /dev/null err> /dev/null
if $env.LAST_EXIT_CODE != 0 {
  ^tmux display-message "Not in a git repository"
  exit 0
}

let res = (do { ^git remote get-url origin } | complete)
if $res.exit_code != 0 {
  ^tmux display-message "No origin remote found"
  exit 0
}

let url = ($res.stdout | str trim)

if ($url | is-empty) {
  ^tmux display-message "No origin remote found"
  exit 0
}

let norm_url = (
  if ($url | str starts-with 'git@github.com:') {
    $url
    | str replace -r '^git@github\.com:' 'https://github.com/'
    | str replace -r '\.git$' ''
  } else if ($url | str starts-with 'https://github.com/') {
    $url | str replace -r '\.git$' ''
  } else {
    $url
  }
)

if ($norm_url | str contains 'github.com') {
  let opener = (
    if ((which xdg-open | length) > 0) {
      'xdg-open'
    } else if ((which wslview | length) > 0) {
      'wslview'
    } else if ((which open | length) > 0) {
      'open'
    } else {
      ''
    }
  )

  if ($opener | is-empty) {
    ^tmux display-message "No URL opener found"
    exit 0
  }

  ^$opener $norm_url out> /dev/null err> /dev/null
  ^tmux display-message "Opened GitHub repository in browser"
} else {
  ^tmux display-message "This repository is not hosted on GitHub"
}