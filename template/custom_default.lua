-- Please write your custom file, then save and restart.

--vim.g.python = "/opt/homebrew/bin/python3"
--vim.g.light_theme = "akane-light"
--vim.g.dark_theme = "akane-dark"
--vim.g.lualine_theme = "akane"
--vim.o.shell = "/opt/homebrew/bin/nu"

--vim.g.lldb = "/opt/homebrew/opt/llvm/bin/lldb-vscode"

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

if vim.g.neovide then
  --vim.o.guifont = "RecMonoCasual Nerd Font:h14"
  --vim.g.neovide_floating_shadow = false
  --vim.g.neovide_transparency = 1
end
