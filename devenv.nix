{
  pkgs,
  lib,
  inputs,
  ...
}: {
  scripts.vendor-grammars.exec = ''
    set -euo pipefail

    rm -rf vendor
    mkdir vendor

    set -x

    ln -s ${inputs.tree-sitter-c} vendor/tree-sitter-c
    ln -s ${inputs.tree-sitter-cpp} vendor/tree-sitter-cpp
    ln -s ${inputs.tree-sitter-nix} vendor/tree-sitter-nix
    ln -s ${inputs.tree-sitter-elixir} vendor/tree-sitter-elixir
    ln -s ${inputs.tree-sitter-elm} vendor/tree-sitter-elm
    ln -s ${inputs.tree-sitter-go} vendor/tree-sitter-go
    ln -s ${inputs.tree-sitter-haskell} vendor/tree-sitter-haskell
    ln -s ${inputs.tree-sitter-javascript} vendor/tree-sitter-javascript
    ln -s ${inputs.tree-sitter-markdown} vendor/tree-sitter-markdown
    ln -s ${inputs.tree-sitter-php} vendor/tree-sitter-php
    ln -s ${inputs.tree-sitter-python} vendor/tree-sitter-python
    ln -s ${inputs.tree-sitter-ruby} vendor/tree-sitter-ruby
    ln -s ${inputs.tree-sitter-rust} vendor/tree-sitter-rust
    ln -s ${inputs.tree-sitter-scss} vendor/tree-sitter-scss
    ln -s ${inputs.tree-sitter-typescript} vendor/tree-sitter-typescript
    ln -s ${inputs.tree-sitter-java} vendor/tree-sitter-java
    ln -s ${inputs.tree-sitter-cuda} vendor/tree-sitter-cuda
  '';

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
