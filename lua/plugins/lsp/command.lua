-- Toggle LSP
vim.api.nvim_create_user_command("LspToggle", function()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    vim.cmd "LspStart"
  else
    vim.cmd "LspStop"
  end
end, {
  desc = "Toggle LSP",
})
