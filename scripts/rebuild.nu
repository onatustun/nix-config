#!/usr/bin/env nu

def main --wrapped [
  ...arguments
]: nothing -> nothing {
  let is_macos = ($nu.os-info | get name) == "macos"

  let system_type = if $is_macos {
    "darwin"
  } else {
    "os"
  }

  let flake = $nu.home-path | path join "nix"

  let host = if $is_macos {
    scutil --get LocalHostName | str trim
  } else {
    hostname | str trim
  }

  let args_split = $arguments
    | prepend ""
    | split list "--"

  let nh_flags = [
    $flake
    "--hostname" $host
    "--show-trace"
  ] | append ($args_split | get 0 | where { $in != "" })

  let nix_flags = [
    "--accept-flake-config"
    "--extra-experimental-features" "pipe-operators"
  ] | append ($args_split | get -o 1 | default [])

  nh $system_type switch ...$nh_flags -- ...$nix_flags
}