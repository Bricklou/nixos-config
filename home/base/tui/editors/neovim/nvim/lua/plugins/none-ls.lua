-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local hover = null_ls.builtins.hover
    local completion = null_ls.builtins.completion

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Common Code Actions
      code_actions.gitsigns,

      -- common refactoring actions based off the Refactoring book by Martin Fowler
      code_actions.refactoring,
      code_actions.gomodifytags, -- Go - modify struct field tags
      code_actions.impl,         -- Go - generate interface method stubs
      code_actions.statix,       -- Lints and suggestions for Nix.

      -- Diagnostic
      diagnostics.actionlint,  -- GitHub Actions workflow syntax checking
      diagnostics.buf,         -- check text in current buffer
      diagnostics.checkmake,   -- check Makefiles
      diagnostics.deadnix,     -- Scan Nix files for dead code.
      diagnostics.trail_space, -- check for trailing whitespace

      -- Formatting
      formatting.prettier,                        -- js/ts/vue/css/html/json/... formatter
      diagnostics.hadolint,                       -- Dockerfile linter
      formatting.black,                           -- Python formatter
      formatting.goimports,                       -- Go formatter
      formatting.gofmt,                           -- Go formatter
      formatting.shfmt,                           -- Shell formatter
      formatting.stylua,                          -- Lua formatter
      formatting.alejandra,                       -- Nix formatter
      formatting.sqlfluff.with {                  -- SQL formatter
        extra_args = { "--dialect", "postgres" }, -- change to your dialect
      },
      require "none-ls.formatting.rustfmt",       -- Rust formatter
    }
    return config                                 -- return final config table
  end,
}
