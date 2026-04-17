let
  inherit (builtins)
    concatMap
    isString
    isList
    isAttrs
    attrValues
    mapAttrs
    attrNames
    filter
    foldl'
    ;

  flattenTree =
    tree:
    concatMap (
      node:
      if isString node && node != "" then
        [ node ]
      else if isList node then
        node
      else if isAttrs node then
        if node ? __functor then node { } else flattenTree node
      else
        [ ]
    ) (attrValues (removeAttrs tree [ "__functor" ]));

  mkTree =
    tree:
    mapAttrs (_: node: if isString node || isList node then node else mkTree node) tree
    // {
      __functor = self: _: flattenTree self;
    };

  keys = mkTree {
    ssh = {
      hosts = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkTg+eQtVPavIgeaEig6kz6uRVxkRxm1VTc4Bg/Z0lt host/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFVULgggFJuA5qbNN2KuSBFCkN6JLIVgO1YIqk0/Povi host/nixos/laptop";
      };

      users = {
        desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS user/nixos/desktop";
        laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp user/nixos/laptop";
      };
    };

    u2f = {
      primary = "JLXDGTk3Ga2sRBz1cCrARjYbPySed5ZGDVX+T70NBePnAAZsxeAiK0Cl4cBXUjZ+3mx/bicbocJdYBf1WpHClw==,XuyXJU85C9ytixnVMBrx5jRuEujpkQJGxW/dS9ZlhjUXzgKw1q4xivdAaN9eFP9WKmDm0RyGo/t3EtxD4wvq0w==,es256,+presence";
      secondary = "lzcAIIfjWzUj3lXxYfCmKDMBJ3QnajAS1bjlqyNP3ece+oN75482SS5vXyPDpK1fBF0+qgzRz3BF8wuC1IUwTQ==,JzQBz79Mg9/uVf5r5J9IsrBDOgSI9hbzaEl2qWnfhSAagT+NVbpibGNRguVMtUjbfzo/jGb20xkJy1r87yelGg==,es256,+presence";
    };
  };

  types = removeAttrs keys.ssh [ "__functor" ];

  adminDevices = [
    "desktop"
    "laptop"
  ];

  typeKeys = mapAttrs (
    _: type:
    type
    // {
      __functor = _: _: type { };
      admins = map (device: type.${device}) (filter (device: type ? ${device}) adminDevices);
    }
  ) types;

  deviceKeys =
    mapAttrs
      (
        device: _:
        map (type: keys.ssh.${type}.${device}) (
          filter (type: keys.ssh.${type} ? ${device}) (attrNames types)
        )
      )
      (
        foldl' (devices: type: devices // removeAttrs types.${type} [ "__functor" ]) { } (attrNames types)
      );
in
keys
// {
  ssh =
    keys.ssh
    // typeKeys
    // deviceKeys
    // {
      __functor = _: _: keys.ssh { };
      admins = concatMap (device: deviceKeys.${device}) adminDevices;
    };
}
