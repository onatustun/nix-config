let
  getAttrFromPath = path: rootAttrs:
    builtins.foldl' (attrs: key:
      attrs.${key})
    rootAttrs
    path;

  at = path:
    getAttrFromPath path
    keys;

  valuesAt = path:
    builtins.attrValues
    (at path);

  roleKeys = os: role:
    builtins.map (scope:
      at [scope os role])
    ["host" "user"];

  mkRole = role: oses: let
    mk = field:
      builtins.map (os:
        at [field os role])
      oses;

    host = mk "host";
    user = mk "user";
  in {
    inherit host user;

    all =
      user
      ++ host;
  };

  keys = {
    host = {
      nixos = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkTg+eQtVPavIgeaEig6kz6uRVxkRxm1VTc4Bg/Z0lt host/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFVULgggFJuA5qbNN2KuSBFCkN6JLIVgO1YIqk0/Povi host/nixos/laptop";
        server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0BhVNZimXHrzRFVXJU9jDfAoXniVTTjuc1JyJkwQy1 host/nixos/server";
      };

      darwin.mini = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPYF71v9QpU2BvKQ4cmhYhCt9XntLRzoNMGJT5KNeN9A host/darwin/mini";

      windows = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIENELrFhwm2jnWiA0WPOumd5BdhQGIXSLal7s/EfRwGY host/windows/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMFzR7clrDd6vcRIztyNzC7g+L/K/QEvRIqYiWpMJLAT host/windows/laptop";
      };
    };

    user = {
      nixos = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS user/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp user/nixos/laptop";
        server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoYZPPyxyApJNi2gk+3eQOhdO4s3x6G24Xof7vcOagz user/nixos/server";
      };

      darwin.mini = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHy3GRjuUAvYOM5P287aTRndjdysdecw2+wiyJyJckg4 user/darwin/mini";

      windows = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF50/8gHMFyadL739tq2mBMexcL1A8j+QDZLwi15yzG4 user/windows/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPaPv4aW5YSl4YxjvPn+eJ/ogGFy0RzhbdyztYVc/GZb user/windows/laptop";
      };
    };
  };
in
  keys
  // rec {
    u2fKeys = [
      "JLXDGTk3Ga2sRBz1cCrARjYbPySed5ZGDVX+T70NBePnAAZsxeAiK0Cl4cBXUjZ+3mx/bicbocJdYBf1WpHClw==,XuyXJU85C9ytixnVMBrx5jRuEujpkQJGxW/dS9ZlhjUXzgKw1q4xivdAaN9eFP9WKmDm0RyGo/t3EtxD4wvq0w==,es256,+presence" # Primary
      "lzcAIIfjWzUj3lXxYfCmKDMBJ3QnajAS1bjlqyNP3ece+oN75482SS5vXyPDpK1fBF0+qgzRz3BF8wuC1IUwTQ==,JzQBz79Mg9/uVf5r5J9IsrBDOgSI9hbzaEl2qWnfhSAagT+NVbpibGNRguVMtUjbfzo/jGb20xkJy1r87yelGg==,es256,+presence" # Backup
    ];

    inherit keys;

    desktopGroup = mkRole "desktop" ["nixos" "windows"];
    laptopGroup = mkRole "laptop" ["nixos" "windows"];
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
      ++ windowsHostKeys;

    userKeys =
      nixosUserKeys
      ++ darwinUserKeys
      ++ windowsUserKeys;

    allKeys =
      hostKeys
      ++ userKeys;
  }
