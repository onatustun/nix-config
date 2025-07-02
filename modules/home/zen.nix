{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.beta];

  programs.zen-browser = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;
      name = username;

      settings = {
        "browser.search.suggest.enabled" = true;
        "extensions.autoDisableScopes" = 0;
      };

      search = {
        force = true;
        default = "kagi";

        order = [
          "kagi"
          "ddg"
          "google"
        ];

        engines = {
          "bing".metaData.hidden = true;
          "google".metaData.alias = "!g";
          "kagi".metaData.alias = "!k";
          "duckduckgo".metaData.alias = "!ddg";

          "Nix Packages" = {
            definedAliases = ["!np"];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

            urls = [
              {
                template = "https://search.nixos.org/packages";

                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };

          "NixOS Options" = {
            definedAliases = ["!no"];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

            urls = [
              {
                template = "https://search.nixos.org/options";

                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };

          "NixOS Wiki" = {
            icon = "https://nixos.wiki/favicon.png";
            definedAliases = ["!nw"];
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            updateInterval = 24 * 60 * 60 * 1000;
          };

          "kagi" = {
            definedAliases = ["!k"];
            icon = "https://kagi.com/asset/80be37f/favicon-32x32.png?v=f6272da653e54e2a660a4d2bd696947a903fb130";
            updateInterval = 24 * 60 * 60 * 1000;

            urls = [
              {template = "https://kagi.com/search?q=%s";}

              {
                type = "application/x-suggestions+json";
                template = "https://kagi.com/api/autosuggest?q=%s";
              }
            ];
          };
        };
      };

      extensions = {
        force = true;

        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          kagi-search
          proton-pass
          return-youtube-dislikes
          sponsorblock
          tridactyl
          ublock-origin
          unpaywall
          violentmonkey
          youtube-shorts-block
        ];
      };
    };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;

      Preferences."browser.tabs.warnOnClose" = {
        "Value" = false;
        "Status" = "locked";
      };

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
