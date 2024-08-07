-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.thrift" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.ocaml" },
  -- import/override with your plugins folder
}
