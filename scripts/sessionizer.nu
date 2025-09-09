#!/usr/bin/env nu

def main [selected?: string] {
  let selected = if ($selected | is-not-empty) {
    $selected
  } else {
    let potential_dirs = [
      $env.HOME
      ($env.HOME | path join "Documents" "code" "git")
      ($env.HOME | path join "Documents" "code")
    ]

    let search_dirs = $potential_dirs | where { |dir| $dir | path exists }

    if ($search_dirs | is-not-empty) {
      let selected_relative =  $search_dirs
        | each { |dir| ^fd --max-depth 1 --type d -H . $dir }
        | flatten
        | each { |path| $path | str replace $"($env.HOME)/" "" }
        | str join "\n"
        | ^sk --margin 10% --color=bw

      if ($selected_relative | is-not-empty) {
        $env.HOME | path join $selected_relative
      } else {
        null
      }
    } else {
      null
    }
  }

  if ($selected | is-empty) {
    exit 0
  }

  let selected_name = $selected
    | path basename
    | str downcase
    | str replace --regex --all "[ .]+" "_"
    | str replace --regex --all "_{2,}" "_"
    | str trim --right --char "_"

  let session_check = do { ^tmux has-session -t $selected_name } | complete

  if $session_check.exit_code != 0 {
    ^tmux new-session -ds $selected_name -c $selected
  }

  ^tmux switch-client -t $selected_name
}