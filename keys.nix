let
  inherit (builtins)
    listToAttrs
    attrValues
    mapAttrs
    attrNames
    concatLists
    head
    ;

  mapAttrs' = f: set: listToAttrs (attrValues (mapAttrs f set));

  keys = {
    host = {
      desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkTg+eQtVPavIgeaEig6kz6uRVxkRxm1VTc4Bg/Z0lt host/nixos/desktop";
      laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFVULgggFJuA5qbNN2KuSBFCkN6JLIVgO1YIqk0/Povi host/nixos/laptop";
    };

    user = {
      desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZjRC59/OYgy+zxrcTPVxhLjlvascA7KAzybIOb0XvS user/nixos/desktop";
      laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIzxmJcUMSUM32Ng9yrDnA8twvn1rRoKYc+A/oLrdFcp user/nixos/laptop";
    };
  };

  types = attrNames keys;

  typeKeys = mapAttrs' (type: set: {
    name = "${type}Keys";
    value = attrValues set;
  }) keys;

  allKeys = concatLists (attrValues typeKeys);

  deviceKeys = mapAttrs' (device: _: {
    name = "${device}Keys";
    value = map (type: keys.${type}.${device}) types;
  }) keys.${head types};

  u2f = {
    primary = "JLXDGTk3Ga2sRBz1cCrARjYbPySed5ZGDVX+T70NBePnAAZsxeAiK0Cl4cBXUjZ+3mx/bicbocJdYBf1WpHClw==,XuyXJU85C9ytixnVMBrx5jRuEujpkQJGxW/dS9ZlhjUXzgKw1q4xivdAaN9eFP9WKmDm0RyGo/t3EtxD4wvq0w==,es256,+presence";
    secondary = "lzcAIIfjWzUj3lXxYfCmKDMBJ3QnajAS1bjlqyNP3ece+oN75482SS5vXyPDpK1fBF0+qgzRz3BF8wuC1IUwTQ==,JzQBz79Mg9/uVf5r5J9IsrBDOgSI9hbzaEl2qWnfhSAagT+NVbpibGNRguVMtUjbfzo/jGb20xkJy1r87yelGg==,es256,+presence";
  };

  u2fKeys = attrValues u2f;
in
keys
// typeKeys
// deviceKeys
// {
  inherit
    allKeys
    u2f
    u2fKeys
    ;
}
