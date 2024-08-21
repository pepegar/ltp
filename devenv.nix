{
  pkgs,
  lib,
  ...
}: {
  packages =
    [pkgs.git]
    ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
      frameworks.Security
    ]);

  languages.rust.enable = true;
  languages.nix.enable = true;
  pre-commit.hooks.rustfmt.enable = true;
  pre-commit.hooks.clippy.enable = true;
  pre-commit.hooks.alejandra.enable = true;
  pre-commit.hooks.deadnix.enable = true;
}
