# Reference: https://github.com/NixOS/nixpkgs/blob/2dda684f9b8d60bac39c22c0eebb076915b31cfb/pkgs/build-support/fetchgit/default.nix

{
  lib,
  stdenvNoCC,
  zig,
}:

lib.makeOverridable (
  lib.fetchers.withNormalizedHash { } (
    {
      name ? null,
      outputHash ? lib.fakeHash,
      outputHashAlgo ? null,
    }:

    stdenvNoCC.mkDerivation {
      name = if name != null then name else name;

      builder = ./builder.sh;
      fetcher = ./fetchZigDeps.sh;
    }
  )
)
