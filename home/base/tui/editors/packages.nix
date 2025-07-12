{pkgs, ...}: {
  home.packages = with pkgs; (
    # -*- Data & Configuration Languages -*-#
    [
      #-- nix
      nil
      # rnix-lsp
      # nixd
      statix # Lints and suggestions for the nix programming language
      deadnix # Find and remove unused code in .nix source files
      alejandra # Nix Code Formatter

      #-- json like
      jsonnet
      jsonnet-language-server
      taplo # TOML language server / formatter / validator
      nodePackages.yaml-language-server
      actionlint # GitHub Actions linter

      #-- dockerfile
      hadolint # Dockerfile linter
      nodePackages.dockerfile-language-server-nodejs

      #-- markdown
      marksman # language server for markdown
      glow # markdown previewer
      pandoc # document converter
      hugo # static site generator

      #-- sql
      sqlfluff
    ]
    ++
    #-*- General Purpose Languages -*-#
    [
      #-- c/c++
      # cmake
      # cmake-language-server
      # gnumake
      # checkmake
      # c/c++ compiler, required by nvim-treesitter!
      gcc
      gdb
      # c/c++ tools with clang-tools, the unwrapped version won't
      # add alias like `cc` and `c++`, so that it won't conflict with gcc
      # llvmPackages.clang-unwrapped
      # clang-tools
      # lldb
      # vscode-extensions.vadimcn.vscode-lldb.adapter # codelldb - debugger

      #-- python
      pyright # python language server
      # (python313.withPackages (
      #   ps:
      #     with ps; [
      #       black # python formatter
      #       # debugpy
      #     ]
      # ))

      (python311.withPackages (
        ps:
          with ps; [
            ruff
          ]
      ))

      #-- rust
      # we'd better use the rust-overlays for rust development
      rustc
      rust-analyzer
      cargo # rust package manager
      watchexec # run commands when files change
      cargo-workspaces
      rustfmt
      clippy # rust linter

      #-- golang
      go
      gomodifytags
      iferr # generate error handling code for go
      impl # generate function implementation for go
      gotools # contains tools like: godoc, goimports, etc.
      gopls # go language server
      delve # go debugger

      # -- java
      # jdk17
      # gradle
      # maven
      # spring-boot-cli
      # jdt-language-server

      #-- lua
      stylua
      lua-language-server
      luarocks

      #-- bash
      nodePackages.bash-language-server
      shellcheck
      shfmt
    ]
    #-*- Web Development -*-#
    ++ [
      nodePackages.nodejs
      nodePackages.typescript
      nodePackages.typescript-language-server
      # HTML/CSS/JSON/ESLint language servers extracted from vscode
      nodePackages.vscode-langservers-extracted
      tailwindcss
      tailwindcss-language-server
      emmet-ls
      eslint_d
      pnpm
    ]
    ++ [
      proselint # English prose linter
      vale # English prose linter

      #-- Optional Requirements:
      nodePackages.prettier # common code formatter
      fzf
      gdu # disk usage analyzer, required by AstroNvim
      tree-sitter
      (ripgrep.override {withPCRE2 = true;}) # recursively searches directories for a regex pattern
    ]
  );
}
