return {
  "MeanderingProgrammer/render-markdown.nvim",
  cmd = "RenderMarkdown",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  ft = function()
    local plugin = require("lazy.core.config").spec.plugins["render-markdown.nvim"]
    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
    return opts.file_types or { "markdown" }
  end,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { render_markdown = true } },
    },
  },
}
