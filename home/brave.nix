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
      { id = "jplgfhpmjnbigmhklmmbgecoobifkmpa"; } # Proton VPN
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
    ];

    commandLineArgs = [
      "--password-store=basic"
      "--disable-search-engine-collection"
      "--extension-mime-request-handling=always-prompt-for-install"
      "--fingerprinting-canvas-image-data-noise"
      "--fingerprinting-canvas-measuretext-noise"
      "--fingerprinting-client-rects-noise"
      "--popups-to-tabs"
      "--show-avatar-button=incognito-and-guest"
      "--force-dark-mode"
      "--enable-gpu-rasterization"
      "--enable-oop-rasterization"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
      "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
      "--no-default-browser-check"
      "--no-service-autorun"
      "--disable-features=PreloadMediaEngagementData,MediaEngagementBypassAutoplayPolicies"
      "--disable-reading-from-canvas"
      "--no-pings"
      "--no-first-run"
      "--no-experiments"
      "--no-crash-upload"
      "--disable-wake-on-wifi"
      "--disable-breakpad"
      "--disable-sync"
      "--disable-speech-api"
      "--disable-speech-synthesis-api"
      "--ozone-platform=wayland"
      "--enable-features=UseOzonePlatform"
    ];
  };
}
