{ callPackage, ... } @ args:

callPackage ./generic.nix (args // {
  version = "5.2.0";
  kde-channel = "stable";
  hash = "sha256-02oZc4pZw2dQucx1IuPJslWQGjOqwGmgeDgnUIqKkpc=";
})
