--- Plantuml plugin for Neovim
return {
  "https://gitlab.com/itaranto/preview.nvim",
  tag = "*",
  opts = {
    previewers_by_ft = {
      plantuml = {
        name = "plantuml_text",
        renderer = { type = "buffer", opts = { split_cmd = "vsplit" } },
      },
    },
  },
}
