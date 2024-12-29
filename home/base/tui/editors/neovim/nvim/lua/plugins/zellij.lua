---@type LazySpec
return {
  "fresh2dev/zellij.vim",
  -- Pin version to avoid breaking changes.
  -- tag = '0.3.*',
  lazy = false,
  init = function()
    -- Options
    -- vim.g.zellij_navigator_move_focus_or_tab = 1
    -- vim.g.zellij_navigator_no_default_mappings = 1
  end,
  keys = {
    {
      "<A-Left>",
      ":ZellijNavigateLeft<CR>",
      desc = "Navigate left window",
    },
    {
      "<A-Right>",
      ":ZellijNavigateRight<CR>",
      desc = "Navigate right window",
    },
    {
      "<A-Up>",
      ":ZellijNavigateUp<CR>",
      desc = "Navigate up window",
    },
    {
      "<A-Down>",
      ":ZellijNavigateDown<CR>",
      desc = "Navigate down window",
    },
  },
}
