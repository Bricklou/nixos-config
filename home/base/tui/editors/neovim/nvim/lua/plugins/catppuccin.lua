return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = function(_, opts)
    opts.flavour = "mocha" -- latte, frappe, macchiato, mocha
    opts.transparent_background = true -- setting the background color.
    opts.color_overrides = {
      mocha = {
        base = "#000000",
      },
    }
    opts.integrations = {
      nvimtree = true,
    }

    opts.highlight_overrides = {
      mocha = function(mocha)
        return {
          NvimTreeNormal = { bg = mocha.none },
        }
      end,
    }
  end,
}
