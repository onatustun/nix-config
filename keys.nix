let
  inherit (builtins) foldl' attrValues;

  getAttrFromPath = path: set:
    path
    |> foldl' (s: k: s.${k}) set;

  at = path:
    keys
    |> getAttrFromPath path;

  valuesAt = path:
    at path
    |> attrValues;

  roleKeys = os: role: [
    (["host" os role]
      |> at)

    (["user" os role]
      |> at)
  ];

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

  nixosHostKeys = valuesAt ["host" "nixos"];
  nixosUserKeys = valuesAt ["user" "nixos"];

  darwinHostKeys = valuesAt ["host" "darwin"];
  darwinUserKeys = valuesAt ["user" "darwin"];

  wslHostKeys = valuesAt ["host" "wsl"];
  wslUserKeys = valuesAt ["user" "wsl"];

  windowsHostKeys = valuesAt ["host" "windows"];
  windowsUserKeys = valuesAt ["user" "windows"];

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
in
  keys
  // {
    inherit hostKeys userKeys;
    allKeys =
      hostKeys
      ++ userKeys;

    inherit nixosHostKeys nixosUserKeys;
    nixosKeys =
      nixosHostKeys
      ++ nixosUserKeys;

    nixosDesktopKeys = roleKeys "nixos" "desktop";
    nixosLaptopKeys = roleKeys "nixos" "laptop";
    nixosServerKeys = roleKeys "nixos" "server";

    inherit darwinHostKeys darwinUserKeys;
    darwinKeys =
      darwinHostKeys
      ++ darwinUserKeys;

    darwinMiniKeys = roleKeys "darwin" "mini";

    inherit wslHostKeys wslUserKeys;
    wslKeys =
      wslHostKeys
      ++ wslUserKeys;

    wslDesktopKeys = roleKeys "wsl" "desktop";
    wslLaptopKeys = roleKeys "wsl" "laptop";

    inherit windowsHostKeys windowsUserKeys;
    windowsKeys =
      windowsHostKeys
      ++ windowsUserKeys;

    windowsDesktopKeys = roleKeys "windows" "desktop";
    windowsLaptopKeys = roleKeys "windows" "laptop";
  }
