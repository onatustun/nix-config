let
  inherit (builtins)
    concatLists
    isString
    isList
    isAttrs
    attrValues
    mapAttrs
    attrNames
    listToAttrs
    filter
    ;

  flattenTree =
    tree:
    concatLists (
      map (
        node:
        if isString node && node != "" then
          [ node ]
        else if isList node then
          node
        else if isAttrs node then
          if node ? __functor then node { } else flattenTree node
        else
          [ ]
      ) (attrValues (removeAttrs tree [ "__functor" ]))
    );

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

  types = attrNames (removeAttrs keys.ssh [ "__functor" ]);

  adminDevices = [
    "desktop"
    "laptop"
  ];

  typeKeys = listToAttrs (
    map (name: {
      inherit name;

      value = keys.ssh.${name} // {
        __functor = _: _: keys.ssh.${name} { };

        admins = map (device: keys.ssh.${name}.${device}) (
          filter (adminDevice: keys.ssh.${name} ? ${adminDevice}) adminDevices
        );
      };
    }) types
  );

  deviceKeys = listToAttrs (
    map
      (name: {
        inherit name;
        value = map (type: keys.ssh.${type}.${name}) (filter (type: keys.ssh.${type} ? ${name}) types);
      })
      (
        attrNames (
          listToAttrs (
            map (name: {
              inherit name;
              value = null;
            }) (concatLists (map (type: attrNames (removeAttrs keys.ssh.${type} [ "__functor" ])) types))
          )
        )
      )
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
      admins = concatLists (map (device: deviceKeys.${device}) adminDevices);
    };
}
