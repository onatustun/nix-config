{lib, ...}: let
  inherit (lib) genAttrs const;
in {
  i18n = let
    locale = "en_GB.UTF-8";

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
  in {
    defaultLocale = locale;

    extraLocaleSettings =
      lcSuffixes
      |> map (suffix: "LC_${suffix}")
      |> (names: genAttrs names (const locale));
  };
}
