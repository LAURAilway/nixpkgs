{ fetchzip, lib, stdenv, makeWrapper, openjdk }:

stdenv.mkDerivation rec {
  pname = "gremlin-console";
  version = "3.5.1";
  src = fetchzip {
    url = "https://downloads.apache.org/tinkerpop/${version}/apache-tinkerpop-gremlin-console-${version}-bin.zip";
    sha256 = "sha256-66krBK5mSMT0scCgMmiaigT/9nmYfItxe1OTzSbX+kE=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/opt
    cp -r ext lib $out/opt/
    install -D bin/gremlin.sh $out/opt/bin/gremlin-console
    makeWrapper $out/opt/bin/gremlin-console $out/bin/gremlin-console \
      --prefix PATH ":" "${openjdk}/bin/" \
      --set CLASSPATH "$out/opt/lib/"
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://tinkerpop.apache.org/";
    description = "Console of the Apache TinkerPop graph computing framework";
    license = licenses.asl20;
    maintainers = [ maintainers.lewo ];
    platforms = platforms.all;
  };
}
