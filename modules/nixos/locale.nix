{lib, ...}: {
  time.timeZone = "Europe/London";

  i18n = let
    locale = "en_GB.UTF-8";
  in {
    defaultLocale = locale;

    extraLocaleSettings = let
      inherit (lib) genAttrs const;

      lcSuffixes = [
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
    in
      lcSuffixes
      |> map (suffix: "LC_${suffix}")
      |> (names: genAttrs names (const locale));
  };
}
