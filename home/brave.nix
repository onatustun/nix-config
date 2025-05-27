{
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      { id = "cdglnehniifkbagbbombnjghhcihifij"; } # Kagi Search
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } # Proton Pass
      { id = "jinjaccalgkegednnccohejagnlnfdag"; } # Violentmonkey
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
    ];

    commandLineArgs = [
      "--disable-breakpad"
      "--disable-reading-from-canvas"
      "--disable-speech-api"
      "--disable-speech-synthesis-api"
      "--disable-sync"
      "--disable-wake-on-wifi"
      "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
      "--enable-features=UseOzonePlatform"
      "--enable-gpu-rasterization"
      "--enable-oop-rasterization"
      "--enable-zero-copy"
      "--extension-mime-request-handling=always-prompt-for-install"
      "--fingerprinting-canvas-image-data-noise"
      "--fingerprinting-canvas-measuretext-noise"
      "--fingerprinting-client-rects-noise"
      "--ignore-gpu-blocklist"
      "--no-crash-upload"
      "--no-default-browser-check"
      "--no-first-run"
      "--no-pings"
      "--no-service-autorun"
      "--ozone-platform=wayland"
      "--popups-to-tabs"
    ];
  };
}
