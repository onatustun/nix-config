let
  inherit (builtins) foldl' attrValues;

  keys = {
    host = {
      nixos = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkTg+eQtVPavIgeaEig6kz6uRVxkRxm1VTc4Bg/Z0lt host/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFVULgggFJuA5qbNN2KuSBFCkN6JLIVgO1YIqk0/Povi host/nixos/laptop";
        server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0BhVNZimXHrzRFVXJU9jDfAoXniVTTjuc1JyJkwQy1 host/nixos/server";
      };

      darwin.mini = "";

      wsl = {
        desktop = "";
        laptop = "";
      };

      windows = {
        desktop = "";
        laptop = "";
      };
    };

    user = {
      nixos = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS user/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp user/nixos/laptop";
        server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoYZPPyxyApJNi2gk+3eQOhdO4s3x6G24Xof7vcOagz user/nixos/server";
      };

      darwin.mini = "";

      wsl = {
        desktop = "";
        laptop = "";
      };

      windows = {
        desktop = "";
        laptop = "";
      };
    };
  };

  getAttrFromPath = path: set:
    path
    |> foldl' (s: k: s.${k}) set;

  at = path:
    keys
    |> getAttrFromPath path;

  valuesAt = path:
    at path
    |> attrValues;

  roleKeys = os: role:
    ["host" "user"]
    |> map (scope:
      [scope os role]
      |> at);

  mkRole = role: oses: let
    host = map (os: at ["host" os role]) oses;
    user = map (os: at ["user" os role]) oses;
  in {
    inherit host user;

    all =
      user
      ++ host;
  };

  desktopGroup = mkRole "desktop" ["nixos" "wsl" "windows"];
  laptopGroup = mkRole "laptop" ["nixos" "wsl" "windows"];
  serverGroup = mkRole "server" ["nixos"];
  miniGroup = mkRole "mini" ["darwin"];

  nixosHostKeys = valuesAt ["host" "nixos"];
  nixosUserKeys = valuesAt ["user" "nixos"];

  nixosKeys =
    nixosHostKeys
    ++ nixosUserKeys;

  nixosDesktopKeys = roleKeys "nixos" "desktop";
  nixosLaptopKeys = roleKeys "nixos" "laptop";
  nixosServerKeys = roleKeys "nixos" "server";

  darwinHostKeys = valuesAt ["host" "darwin"];
  darwinUserKeys = valuesAt ["user" "darwin"];

  darwinKeys =
    darwinHostKeys
    ++ darwinUserKeys;

  darwinMiniKeys = roleKeys "darwin" "mini";

  wslHostKeys = valuesAt ["host" "wsl"];
  wslUserKeys = valuesAt ["user" "wsl"];

  wslKeys =
    wslHostKeys
    ++ wslUserKeys;

  wslDesktopKeys = roleKeys "wsl" "desktop";
  wslLaptopKeys = roleKeys "wsl" "laptop";

  windowsHostKeys = valuesAt ["host" "windows"];
  windowsUserKeys = valuesAt ["user" "windows"];

  windowsKeys =
    windowsHostKeys
    ++ windowsUserKeys;

  windowsDesktopKeys = roleKeys "windows" "desktop";
  windowsLaptopKeys = roleKeys "windows" "laptop";

  desktopHostKeys = desktopGroup.host;
  desktopUserKeys = desktopGroup.user;

  desktopKeys =
    desktopUserKeys
    ++ desktopHostKeys;

  laptopHostKeys = laptopGroup.host;
  laptopUserKeys = laptopGroup.user;

  laptopKeys =
    laptopUserKeys
    ++ laptopHostKeys;

  serverHostKeys = serverGroup.host;
  serverUserKeys = serverGroup.user;

  serverKeys =
    serverUserKeys
    ++ serverHostKeys;

  miniHostKeys = miniGroup.host;
  miniUserKeys = miniGroup.user;

  miniKeys =
    miniUserKeys
    ++ miniHostKeys;

  adminHostKeys =
    desktopHostKeys
    ++ laptopHostKeys;

  adminUserKeys =
    desktopUserKeys
    ++ laptopUserKeys;

  adminKeys =
    adminUserKeys
    ++ adminHostKeys;

  hostKeys =
    nixosHostKeys
    ++ darwinHostKeys
    ++ wslHostKeys
    ++ windowsHostKeys;

  userKeys =
    nixosUserKeys
    ++ darwinUserKeys
    ++ wslUserKeys
    ++ windowsUserKeys;

  allKeys =
    hostKeys
    ++ userKeys;
in
  keys
  // {
    inherit nixosHostKeys nixosUserKeys;
    inherit nixosKeys;
    inherit nixosDesktopKeys nixosLaptopKeys nixosServerKeys;

    inherit darwinHostKeys darwinUserKeys;
    inherit darwinKeys;
    inherit darwinMiniKeys;

    inherit wslHostKeys wslUserKeys;
    inherit wslKeys;
    inherit wslDesktopKeys wslLaptopKeys;

    inherit windowsHostKeys windowsUserKeys;
    inherit windowsKeys;
    inherit windowsDesktopKeys windowsLaptopKeys;

    inherit desktopHostKeys desktopUserKeys;
    inherit desktopKeys;

    inherit laptopHostKeys laptopUserKeys;
    inherit laptopKeys;

    inherit serverHostKeys serverUserKeys;
    inherit serverKeys;

    inherit miniHostKeys miniUserKeys;
    inherit miniKeys;

    inherit adminHostKeys adminUserKeys;
    inherit adminKeys;

    inherit hostKeys userKeys;
    inherit allKeys;
  }
