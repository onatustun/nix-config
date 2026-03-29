{
  flake.nixosModules.locale =
    { lib, ... }:
    let
      locale = "en_GB.UTF-8";
      inherit (lib.attrsets) genAttrs;
      inherit (lib.trivial) const;
    in
    {
      time.timeZone = "Europe/London";

      i18n = {
        defaultLocale = locale;

        extraLocaleSettings = genAttrs (map (suffix: "LC_${suffix}") [
          "ADDRESS"
          "IDENTIFICATION"
          "MEASUREMENT"
          "MONETARY"
          "NAME"
          "NUMERIC"
          "PAPER"
          "TELEPHONE"
          "TIME"
        ]) (const locale);
      };
    };
}
