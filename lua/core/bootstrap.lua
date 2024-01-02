local utils = require "core.utils"
local lazypath = utils.path_join(vim.fn.stdpath "data", "lazy", "lazy.nvim")

-- Check plugin manager
if not vim.loop.fs_stat(lazypath) then
  print "Downloading ..."
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    vim.g.github_url .. "folke/lazy.nvim.git",
    lazypath,
  }
end

-- Load lazy.nvim
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  -- Load plugins
  { import = "plugins" },
}, {
  git = {
    -- Git mirror
    url_format = vim.g.github_url .. "%s.git",
  },
})
