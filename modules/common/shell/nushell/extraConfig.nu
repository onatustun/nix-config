$env.config.history.file_format = "sqlite"
$env.config.history.isolation = false
$env.config.history.max_size = 10_000_000
$env.config.history.sync_on_enter = true

$env.config.show_banner = false

$env.config.edit_mode = "vi"

$env.config.cursor_shape.emacs = "line"
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

$env.config.completions.algorithm = "substring"
$env.config.completions.sort = "smart"
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.use_ls_colors = true
$env.config.ls.use_ls_colors = true
$env.config.ls.clickable_links = true

$env.config.use_kitty_protocol = true

$env.config.shell_integration.osc2 = false
$env.config.shell_integration.osc7 = true
$env.config.shell_integration.osc8 = true
$env.config.shell_integration.osc9_9 = false
$env.config.shell_integration.osc133 = true
$env.config.shell_integration.osc633 = true
$env.config.shell_integration.reset_application_mode = true

$env.config.bracketed_paste = true

$env.config.buffer_editor = "hx"

$env.config.use_ansi_coloring = true

$env.config.error_style = "fancy"

$env.config.footer_mode = 25

$env.config.datetime_format = {}

$env.config.render_right_prompt_on_last_line = false

$env.config.float_precision = 2

def toggle-editor [] {
  let hx_frozen = (
    job list
    | where { |r| ($r.tag | default '') == 'hx'
    and ($r.type | default '') == 'frozen' }
  )

  if ($hx_frozen | is-empty) {
    hx .
  } else {
    job unfreeze
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

source "~/.config/nushell/carapace.nu"
