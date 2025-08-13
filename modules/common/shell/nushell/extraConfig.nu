$env.config = {
  bracketed_paste: true
  buffer_editor: ""
  datetime_format: {}
  edit_mode: vi
  error_style: fancy
  float_precision: 2
  footer_mode: 25
  render_right_prompt_on_last_line: false
  show_banner: false
  use_ansi_coloring: true
  use_kitty_protocol: true
}

def toggle-editor [] {
  if ((job list) | length) > 0 {
    sleep 100ms
    job unfreeze
  } else {
    hx .
  }
}

$env.config.keybindings = [
  {
    name: toggle_editor
    modifier: control
    keycode: char_z
    mode: [emacs, vi_insert, vi_normal]
    event: {
      send: executehostcommand
      cmd: "toggle-editor"
    }
  }
]