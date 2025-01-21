---@type LazyPlugin
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    -- Override cmp source priority to display LSP items first in the completion list
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip",  priority = 750 },
      { name = "buffer",   priority = 500 },
      { name = "path",     priority = 250 },
      { name = "emoji",    priority = 700 },
    }

    opts.formatting = {
      format = function(entry, item)
        local color_item = require("nvim-highlight-colors").format(entry, item)
        item = require("lspkind").cmp_format {} (entry, item)
        if color_item.abbr_hl_group then
          item.kind_hl_group = color_item.abbr_hl_group
          item.kind = color_item.abbr
        end
        return item
      end,
    }
  end,
}
