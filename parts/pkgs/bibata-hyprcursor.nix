{
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation (final: {
  pname = "bibata-hyprcursor";
  version = "1.0";

  src = fetchurl {
    url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/${version}/hypr_Bibata-Modern-Ice.tar.gz";
    sha256 = "sha256-3ttG6Hnr9TPtvIiIbQrsSodu5iZV4Y62xaKvQmkdLPg=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons
    cp -r hypr_Bibata-Modern-Ice $out/share/icons/

    runHook postInstall
  '';
})
