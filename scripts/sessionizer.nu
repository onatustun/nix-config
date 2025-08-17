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
            let found_dirs = $search_dirs 
                | each { |dir| fd --max-depth 1 --type d . $dir }
                | flatten
                | each { |path| $path | str replace $"($env.HOME)/" "" }

            let selected_relative = $found_dirs 
                | sk --margin 10% --color=bw
                | complete
                | get stdout
                | str trim

            if ($selected_relative | is-not-empty) {
                $env.HOME | path join $selected_relative
            } else {
                ""
            }
        } else {
            ""
        }
    }

    if ($selected | is-empty) {
        exit 0
    }

    let selected_name = $selected 
        | path basename 
        | str replace --all "." "_"

    let session_exists = tmux has-session -t $selected_name 
        | complete 
        | get exit_code
        | $in == 0

    if not $session_exists {
        tmux new-session -ds $selected_name -c $selected
    }

    tmux switch-client -t $selected_name
}