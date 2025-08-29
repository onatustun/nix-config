{
  lib,
  pkgs,
  inputs,
  isDarwin,
  username,
  ...
}: let
  inherit (lib) getExe' enabled getExe;
  inherit (pkgs.nuenv) writeScriptBin;
  inherit (builtins) readFile;
  inherit (inputs) self;

  helixDrv =
    if isDarwin
    then pkgs.helix
    else inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;

  helixExe = getExe' helixDrv "hx";
  nushellExe = getExe' pkgs.nushell "nu";

  rebuild = writeScriptBin {
    name = "rebuild";
    script = readFile (self + "/scripts/rebuild.nu");
  };
in {
  users.users.${username}.shell = pkgs.nushell;
  environment.shells = [pkgs.nushell];

  home-manager.sharedModules = [
    {
      home.sessionVariables.SHELL = nushellExe;

      programs.nushell = enabled {
        environmentVariables = {
          SHELL = nushellExe;
          CARAPACE_BRIDGES = "inshellisense,carapace,zsh,fish,bash";
          EDITOR = helixExe;
          VISUAL = helixExe;
          NIXPKGS_ALLOW_UNFREE = "1";
          PROMPT_COMMAND = "";
          PROMPT_COMMAND_RIGHT = "";
          PROMPT_INDICATOR_VI_INSERT = "";
          PROMPT_INDICATOR_VI_NORMAL = "";
          TRANSIENT_PROMPT_COMMAND = "";
          TRANSIENT_PROMPT_COMMAND_RIGHT = "";
          TRANSIENT_PROMPT_INDICATOR = "";
          TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = "";
          TRANSIENT_PROMPT_INDICATOR_VI_INSERT = "";
          TRANSIENT_PROMPT_MULTILINE_INDICATOR = "";
        };

        shellAliases = {
          c = "clear";
          cp = "cp -prv";
          ff = "fastfetch";
          la = "ls -a";
          lla = "ls -la";
          ll = "ls -l";
          l = "ls";
          lt = "eza -T --git-ignore --group-directories-first";
          man = "batman";
          md = "mkdir -v";
          melt = "nix-melt";
          mv = "mv -v";
          ns = "nix-search";
          rmf = "rm -frv";
          rm = "rm -rv";
          sl = "ls";
          s = "sudo -E";
          "sx." = "sudo -E hx .";
          sx = "sudo -E hx";
          tree = "eza -T --git-ignore --group-directories-first";
          "x." = "hx .";
          x = "hx";
          z = "cd";
          zi = "cdi";
        };

        extraConfig = ''
          ${readFile ./extraConfig.nu}

          def --wrapped rebuild [...args]: nothing -> nothing {
            ${getExe rebuild} ...$args
          }
        '';
      };
    }
  ];
}
