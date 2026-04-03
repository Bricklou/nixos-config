-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  dependencies = {
    -- NOTE: additional parser
    "monaqa/tree-sitter-mermaid",
  },
  opts = {
    treesitter = {
      highlight = true,    -- enable/disable treesitter based highlighting
      indent = true,       -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        -- please add only the tree-sitters that are not available in nixpkgs here
        "just",
        "kdl",
        "csv",
        "xml",

        ---- Misc
        "diff",
        "git_config",
        "git_rebase",
        "gitignore",
        "gitcommit",
        "gitattributes",
        "ssh_config",
        -- add more arguments for adding more treesitter parsers
      }
    }
  },
}
