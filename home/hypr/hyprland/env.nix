{
  isLaptop,
  lib,
  ...
}: {
  env = [
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
    "NIXOS_OZONE_WL, 1" 
    "MOZ_ENABLE_WAYLAND, 1"
    "QT_QPA_PLATFORM,wayland"
    "XDG_SESSION_TYPE,wayland"
    "HYPRCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,hypr_Bibata-Modern-Ice"
    "WLR_NO_HARDWARE_CURSORS,1"
    "WLR_RENDERER_ALLOW_SOFTWARE,1"
    "XCURSOR_SIZE,24"
  ] ++ lib.optionals (!isLaptop) [
    "GBX_BACKEND, nvidia-drm"
    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    "LIBVA_DRIVER_NAME,nvidia"
    "__GL_GSYNC_ALLOWED, 1"
    "__GL_VRR_ALLOWED, 1"
  ];
}
