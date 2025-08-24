let
  inherit (builtins) foldl' isAttrs attrValues;

  flatten = attrs:
    foldl' (
      acc: v:
        acc
        ++ (
          if isAttrs v
          then flatten v
          else [v]
        )
    ) [] (attrValues attrs);

  keys = {
    host = {
      nixos = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkTg+eQtVPavIgeaEig6kz6uRVxkRxm1VTc4Bg/Z0lt host/nixos/desktop";
        server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0BhVNZimXHrzRFVXJU9jDfAoXniVTTjuc1JyJkwQy1 host/nixos/server";
      };

      # darwin = {};
      # wsl = {};
      # windows = {};
    };

    user = {
      nixos = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS user/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp user/nixos/laptop";
        server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILoYZPPyxyApJNi2gk+3eQOhdO4s3x6G24Xof7vcOagz user/nixos/server";
      };

      # darwin = {};
      # wsl = {};
      # windows = {};
    };
  };
in {
  inherit keys;

  hostKeys = flatten keys.host;
  userKeys = flatten keys.user;
  allKeys = flatten keys;
}
