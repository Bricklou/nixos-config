return {
  "catppuccin/nvim",
  name = "catppuccin",
  ---@type CatppuccinOptions
  opts = {
    dim_inactive = { enabled = true, percentage = 0.25 },
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- setting the background color.
    color_overrides = {
      mocha = {
        base = "#000000",
      },
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    custom_highlights = {
      -- disable italics  for treesitter highlights
      LspInlayHint = { style = { "italic" } },
      UfoFoldedEllipsis = { link = "UfoFoldedFg" },
      ["@parameter"] = { style = {} },
      ["@type.builtin"] = { style = {} },
      ["@namespace"] = { style = {} },
      ["@text.uri"] = { style = { "underline" } },
      ["@tag.attribute"] = { style = {} },
      ["@tag.attribute.tsx"] = { style = {} },
    },
  },
}
