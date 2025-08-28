{
  lib,
  config,
  ...
}: let
  inherit (lib) mkDefault;
in {
  home-manager.sharedModules = [
    {
      programs.wlogout.style = mkDefault ''
        * {
          background-image: none;
          font-size: 20px;
        }

        button {
          color: ${config.stylix.base16Scheme.base07};
          color: ${config.stylix.base16Scheme.base00};
          border-style: solid;
          border-radius: 0px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 15%;
        }

        button:focus,
        button:active,
        button:hover {
          background-color: ${config.stylix.base16Scheme.base0D};
          outline-style: none;
        }
      '';
    }
  ];
}
