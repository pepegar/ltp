# LTP

> Language Treesitter Protocol

The idea is something like follows:

parse source files into treesitter AST. index treesitter AST into a SQLite,
implement LSP protocol by querying that sqlite.

- [ ] parse files into treesitter AST
- [ ] traverse treesitter AST
- [ ] store code info in a SQLite
- [ ] what to do with external dependencies?
    - for Kotlin (i want this whole thing bc/ Kotlin nis horrible outside of JB
      ecosystem) one could, theoretically, download jars with sources, unzip
      them, and run them through this same process...
