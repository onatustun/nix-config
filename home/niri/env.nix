{
  isLaptop,
  lib,
  ...
}:
{
  CLUTTER_BACKEND = "wayland";
  DISPLAY = ":0";
  ELECTRON_OZONE_PLATFORM_HINT = "auto";
  GDK_BACKEND = "wayland,x11";
  MOZ_ENABLE_WAYLAND = "1";
  NIXOS_OZONE_WL = "1";
  SDL_VIDEODRIVER = "wayland";

  QT_QPA_PLATFORM = "wayland";
  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

  WLR_NO_HARDWARE_CURSORS = "1";
  WLR_RENDERER_ALLOW_SOFTWARE = "1";

  HYPRCURSOR_SIZE = "24";
  HYPRCURSOR_THEME = "hypr_Bibata-Modern-Ice";
  XCURSOR_SIZE = "24";

  XDG_CURRENT_DESKTOP = "niri";
  XDG_SESSION_TYPE = "wayland";
}
// lib.optionalAttrs (!isLaptop) {
  GBX_BACKEND = "nvidia-drm";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  LIBVA_DRIVER_NAME = "nvidia";
  __GL_GSYNC_ALLOWED = "1";
  __GL_VRR_ALLOWED = "1";
}
