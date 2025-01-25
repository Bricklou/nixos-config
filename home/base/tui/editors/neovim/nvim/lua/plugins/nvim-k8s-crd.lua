return {
  "anasinnyk/nvim-k8s-crd",
  -- "Bricklou/nvim-k8s-crd",
  event = { "BufEnter *.yaml" },
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    k8s = { file_mask = nil },
  },
}
