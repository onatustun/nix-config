#!/usr/bin/env nu

def main --wrapped [
  ...arguments
]: nothing -> nothing {
  let system_type = if ($nu.os-info | get name) == "macos" {
    "darwin"
  } else {
    "os"
  }

  let flake = ($nu.home-path | path join "nix")
  let host = (hostname | str trim)
  let args_split = $arguments | prepend "" | split list "--"

  let nh_flags = [
    $flake
    "--hostname" $host
    "--bypass-root-check"
    "--show-trace"
  ] | append ($args_split | get 0 | where { $in != "" })

  let nix_flags = [
    "--accept-flake-config"
    "--extra-experimental-features" "pipe-operators"
  ] | append ($args_split | get -o 1 | default [])

  sudo NH_NO_CHECKS=true nh $system_type switch ...$nh_flags -- ...$nix_flags
}