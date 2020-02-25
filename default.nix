{ stdenvNoCC
, lib
, fetchFromGitHub
, makeWrapper
, coreutils
, findutils
, nix
}:

stdenvNoCC.mkDerivation rec {
  name = "nix-build-gc-2020-01-20";

  src = fetchFromGitHub {
    owner = "MatrixAI";
    repo = "nix-build-gc";
    rev = "52df0daba11bea6380e7eceb31617263f1314f5c";
    sha256 = "05x624h1mb4lmm37z1xvr6bsvspdfxpiy007j4pw3i4jx4wm5nsn";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D -m755 nix-build-gc $out/bin/nix-build-gc
  '';

  postFixup = ''
    wrapProgram $out/bin/nix-build-gc --set PATH ${lib.makeBinPath [ coreutils findutils nix ]}
  '';
}
