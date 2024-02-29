-- Please write your custom file, then save and restart.

-- vim.g.transparent = true
-- vim.g.following_system = true
-- vim.g.python = "/opt/homebrew/bin/python3"
-- vim.g.lldb = "/opt/homebrew/opt/llvm/bin/lldb-vscode"

-- vim.o.shell = "/opt/homebrew/bin/nu"
-- use nushell on windows
-- vim.api.nvim_command "let &shell = 'nu'"
-- vim.api.nvim_command "let &shellcmdflag = '-c'"
-- vim.api.nvim_command 'let &shellquote = ""'
-- vim.api.nvim_command 'let &shellxquote = ""'

lsp_servers = {
  "bashls",
  "biome",
  "clangd",
  "cmake",
  "lua_ls",
  "nushell",
  "pyright",
  "rust_analyzer",
  "taplo",
  "zls",
}

-- neovide
-- if vim.g.neovide then
--   vim.o.guifont = "RecMonoCasual Nerd Font:h14"
--   vim.g.neovide_floating_shadow = false
--   vim.g.neovide_transparency = 1
-- end

-- neovim-qt
-- if vim.fn.has "gui_running" then
--   vim.opt.guifont = "RecMonoCasual Nerd Font:h14"
-- end
