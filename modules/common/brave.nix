{pkgs, ...}: {
  home-manager.sharedModules = [
    {
      programs.chromium = {
        enable = true;
        package = pkgs.brave;

        extensions = [
          {id = "cdglnehniifkbagbbombnjghhcihifij";} # Kagi Search
          {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # uBlock Origin
          {id = "gebbhagfogifgggkldgodflihgfeippi";} # Return Youtube Dislike
          {id = "ghmbeldphafepmbegfdlkpapadhbakde";} # Proton Pass
          {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium C
          {id = "jinjaccalgkegednnccohejagnlnfdag";} # Violentmonkey
          {id = "mmioliijnhnoblpgimnlajmefafdfilb";} # Shazam
          {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # SponsorBlock
        ];

        commandLineArgs = [
          "--enable-features=UseOzonePlatform,WaylandWindowDecorations"
          "--ozone-platform=wayland"

          "--enable-gpu-rasterization"
          "--enable-oop-rasterization"
          "--enable-zero-copy"
          "--ignore-gpu-blocklist"
          "--enable-hardware-overlays"

          "--enable-smooth-scrolling"
          "--enable-tcp-fast-open"
          "--max_old_space_size=4096"

          "--enable-blink-features=MiddleClickAutoscroll"
          "--disable-breakpad"
          "--disable-reading-from-canvas"
          "--disable-speech-api"
          "--disable-speech-synthesis-api"
          "--disable-sync"
          "--disable-wake-on-wifi"
          "--disk-cache=$XDG_RUNTIME_DIR/chromium-cache"
          "--extension-mime-request-handling=always-prompt-for-install"
          "--fingerprinting-canvas-image-data-noise"
          "--fingerprinting-canvas-measuretext-noise"
          "--fingerprinting-client-rects-noise"
          "--no-crash-upload"
          "--no-default-browser-check"
          "--no-first-run"
          "--no-pings"
          "--no-service-autorun"
          "--popups-to-tabs"
        ];
      };
    }
  ];
}
