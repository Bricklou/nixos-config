-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Motion
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.flash-nvim" },
  -- Highly experimental plugin that completely replaces
  -- the UI for messages, cmdline and the popupmenu.
  -- { import = "astrocommunity.utility.noice-nvim" },
  -- Fully featured & enhanced replacement for copilot.vim
  -- <Tab> work with both auto completion in cmp and copilot
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- Language Support
  ---- Frontend & NodeJS
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.vue" },
  ---- Configuration Language
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.mdx" },
  ---- Backend / System
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.sql" },
  -- { import = "astrocommunity.pack.nix" },  -- manually add config for nix, comment this one.

  ---- Operation & Cloud Native
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.helm" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Lua implementation of CamelCaseMotion, with extra consideration of punctuation.
  { import = "astrocommunity.motion.nvim-spider" },
  -- AI Assistant
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Code Completion
  { import = "astrocommunity.completion.cmp-emoji" },
}
