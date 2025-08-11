{homeDir, ...}: {
  home-manager.sharedModules = [
    {
      programs.fish.functions = {
        cpp = "cp -prv $argv ..";
        flakeinit = "nix flake init -t '${homeDir}/nix#'\$argv";
        mvp = "mv -v $argv ..";
        rebuild = "nh os switch -H $argv --accept-flake-config";
        shot = "grim -g \"$(slurp)\" ${homeDir}/Pictures/$argv.png";

        toggle-editor = ''
          if jobs -q
            sleep 0.1
            fg 2>/dev/null
          else
            hx .
          end
        '';
      };
    }
  ];
}
