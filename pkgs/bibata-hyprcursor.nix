{
  fetchurl,
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "bibata-hyprcursor";
  version = "1.0";
  dontUnpack = true;

  src = fetchurl {
    url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Ice.tar.gz";
    sha256 = "sha256-3ttG6Hnr9TPtvIiIbQrsSodu5iZV4Y62xaKvQmkdLPg=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons/hypr_Bibata-Modern-Ice
    cd $out/share/icons/hypr_Bibata-Modern-Ice
    tar -xzf $src --strip-components=1

    runHook postInstall
  '';
}
