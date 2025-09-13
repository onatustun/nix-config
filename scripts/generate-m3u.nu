#!/usr/bin/env nu

let music_dir = $env.HOME | path join "Music"
let audio_regex = '(?i)\.(mp3|flac|m4a|aac|wav|ogg|opus|wma|aif|aiff)$'

let artist_dirs = (
  fd . $music_dir --type d --max-depth 1 --absolute-path
  | lines
  | sort
)

for artist_dir in $artist_dirs {
  let artist_name =  $artist_dir | path basename
  let m3u_path = [$artist_dir $"($artist_name).m3u"] | path join
  let tmp_path = $"($m3u_path).tmp"

  let audio_files =  (
    fd $audio_regex $artist_dir --type f --absolute-path
    | lines
    | sort
  )

  if ($audio_files | is-empty ) {
    continue
  }

  let playlist_entries = (
    $audio_files
    | path relative-to $artist_dir
    | sort
  )

  let header = "#EXTM3U"
  let body = $playlist_entries | str join (char newline)
  let text = $"($header)\n($body)\n"

  let current = if ($m3u_path | path exists) {
    open --raw $m3u_path
  } else {
    ""
  }

  let has_changes = $current != $text

  if $has_changes {
    $text | save --force --raw $tmp_path
    mv --force $tmp_path $m3u_path
  }

  let status = if $has_changes {
    "Written"
  } else {
    "Unchanged"
  }

  let entry_count = $playlist_entries | length
  print $"($status): ($m3u_path) - entries: ($entry_count)"
}