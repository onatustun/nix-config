{
  flake.nixosModules = {
    system = {
      lib,
      self,
      ...
    }: {
      imports = lib.lists.singleton self.nixosModules.locale;
    };

    locale = {lib, ...}: let
      locale = "en_GB.UTF-8";
    in {
      time.timeZone = "Europe/London";

      i18n = {
        defaultLocale = locale;

        extraLocaleSettings =
          lib.attrsets.genAttrs (lib.lists.map (suffix: "LC_${suffix}") [
            "ADDRESS"
            "IDENTIFICATION"
            "MEASUREMENT"
            "MONETARY"
            "NAME"
            "NUMERIC"
            "PAPER"
            "TELEPHONE"
            "TIME"
          ])
          (lib.trivial.const locale);
      };
    };
  };
}
