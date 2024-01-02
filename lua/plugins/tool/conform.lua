-- Format
local opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    json = { "jq" },
  },
}

vim.g.auto_format_id = nil
vim.api.nvim_create_user_command("AutoFormatToggle", function()
  if vim.g.auto_format_id == nil then
    vim.g.auto_format_id = vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function(args)
        require("conform").format { bufnr = args.buf }
      end,
    })
    vim.notify "AutoFormat enabled"
  else
    vim.api.nvim_del_autocmd(vim.g.auto_format_id)
    vim.g.auto_format_id = nil
    vim.notify "AutoFormat disabled"
  end
end, {
  desc = "Toggle auto-format",
})

require("conform").setup(opts)
vim.cmd "AutoFormatToggle"
