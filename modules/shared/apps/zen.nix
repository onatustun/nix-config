{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [inputs.nur.modules.nixos.default];

  environment.sessionVariables."BROWSER" = "zen-twilight";

  home-manager.sharedModules = [
    inputs.zen-browser.homeModules.twilight

    {
      programs.zen-browser = {
        enable = true;
        nativeMessagingHosts = [pkgs.ff2mpv-rust];

        profiles.default = {
          id = 0;
          isDefault = true;
          name = username;

          settings = {
            "browser.search.suggest.enabled" = true;
            "extensions.autoDisableScopes" = 0;

            "distribution.searchplugins.defaultLocale" = "en-GB";
            "general.useragent.locale" = "en-GB";

            "gfx.webrender.all" = true;
            "media.ffmpeg.vaapi.enabled" = true;
            "toolkit.telemetry.enabled" = false;

            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;

            "cookiebanners.service.mode" = 2;
            "cookiebanners.service.mode.privateBrowsing" = 2;

            "app.update.auto" = false;

            "datareporting.policy.dataSubmissionEnable" = false;
            "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;

            "media.autoplay.default" = 5;

            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "extensions.pocket.enabled" = false;

            "browser.bookmarks.restore_default_bookmarks" = false;
            "browser.contentblocking.category" = "strict";
            "browser.ctrlTab.recentlyUsedOrder" = false;
            "browser.discovery.enabled" = true;
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.search.defaultenginename" = "Kagi";
            "browser.search.order.1" = "Kagi";
            "browser.sessionstore.resume_from_crash" = true;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.aboutConfig.showWarning" = false;

            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.newtabpage.activity-stream.discoverystream.recentSaves.enabled" = false;
            "browser.newtabpage.activity-stream.discoverystream.spocTopsitesPlacement.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.feeds.snippets" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.activity-stream.showRecentSaves" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.feeds.system.topsites" = false;
            "browser.newtabpage.activity-stream.topSitesRows" = false;
            "browser.newtabpage.pinned" = false;

            "browser.newtabpage.activity-stream.feeds.sections" = false;
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
            "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;

            "browser.protections_panel.infoMessage.seen" = true;
            "browser.quitShortcut.disabled" = true;
            "browser.taskbar.lists.enabled" = false;
            "browser.taskbar.lists.frequent.enabled" = false;
            "browser.taskbar.lists.recent.enabled" = false;
            "browser.taskbar.lists.tasks.enabled" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "browser.urlbar.suggest.openpage" = false;
            "browser.startup.homepage" = "about:blank";
            "browser.search.region" = "GB";
            "browser.search.isUS" = false;
            "browser.bookmarks.showMobileBookmarks" = false;
          };

          search = {
            force = true;
            default = "Kagi";

            order = [
              "Kagi"
              "ddg"
              "google"
            ];

            engines = {
              "bing".metaData.hidden = true;
              "bookmarks".metaData.hidden = true;
              "ebay".metaData.hidden = true;
              "wikipedia".metaData.hidden = true;

              "ddg".metaData.alias = "!ddg";
              "google".metaData.alias = "!g";

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

              "Kagi" = {
                definedAliases = ["!k"];
                icon = "https://kagi.com/asset/80be37f/favicon-32x32.png?v=f6272da653e54e2a660a4d2bd696947a903fb130";
                updateInterval = 24 * 60 * 60 * 1000;

                urls = [
                  {template = "https://kagi.com/search?q={searchTerms}";}

                  {
                    type = "application/x-suggestions+json";
                    template = "https://kagi.com/api/autosuggest?q={searchTerms}";
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
              ublock-origin
              unpaywall
              vimium-c
              violentmonkey
              youtube-shorts-block
            ];
          };
        };

        policies = {
          AppAutoUpdate = false;
          AutofillAddressEnabled = false;
          AutofillCreditCardEnabled = false;
          BackgroundAppUpdate = false;
          DisableAppUpdate = true;
          DisableBuiltinPDFViewer = true;
          DisableFeedbackCommands = true;
          DisableFirefoxAccounts = true;
          DisableFirefoxScreenshots = true;
          DisableFirefoxStudies = true;
          DisableForgetButton = true;
          DisableFormHistory = true;
          DisableMasterPasswordCreation = true;
          DisablePasswordReveal = true;
          DisablePocket = true;
          DisableProfileImport = true;
          DisableProfileRefresh = true;
          DisableSetDesktopBackground = true;
          DisableTelemetry = true;
          DisplayMenuBar = "default-off";
          DontCheckDefaultBrowser = true;
          HardwareAcceleration = true;
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          PasswordManagerEnabled = false;
          SearchSuggestEnabled = true;
          ShowHomeButton = false;

          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
            EmailTracking = true;
          };

          EncryptedMediaExtensions = {
            Enabled = true;
            Locked = true;
          };

          ExtensionUpdate = false;

          FirefoxHome = {
            Search = false;
            TopSites = false;
            SponsoredTopSites = false;
            Highlights = false;
            Pocket = false;
            SponsoredPocket = false;
            Snippets = false;
            Locked = true;
          };

          FirefoxSuggest = {
            WebSuggestions = false;
            SponsoredSuggestions = false;
            ImproveSuggest = false;
            Locked = true;
          };

          SearchEngines = {
            PreventInstalls = true;

            Remove = [
              "bing"
              "ebay"
              "wikipedia"
            ];
          };

          Preferences."browser.tabs.warnOnClose" = {
            "Value" = false;
            "Status" = "locked";
          };
        };
      };
    }
  ];

  /*
  manual setups:
  general:
    enable:
      continue where you left off
      ctrl tab

  look and feel:
    enable:
      single toolbar
      right side toolbar
      compact: hide both
      always floating

  privacy
    enable:
      https only

    disable:
      new tab button

  keyboard:
    shift ctrl c compact mode

  remove essentials, pins, spaces
  */
}
