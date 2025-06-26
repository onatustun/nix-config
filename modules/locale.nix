{lib, ...}: let
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
in {
  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = locale;
    extraLocaleSettings = lib.genAttrs (map (v: "LC_${v}") lcVars) (_: locale);
  };
}
