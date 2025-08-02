{lib, ...}: {
  time.timeZone = "Europe/London";

  i18n = let
    locale = "en_GB.UTF-8";

    lcVars = [
      "ADDRESS"
      "IDENTIFICATION"
      "MEASUREMENT"
      "MONETARY"
      "NAME"
      "NUMERIC"
      "PAPER"
      "TELEPHONE"
      "TIME"
    ];

    inherit (lib) genAttrs;
  in {
    defaultLocale = locale;
    extraLocaleSettings = genAttrs (map (v: "LC_${v}") lcVars) (_: locale);
  };
}
