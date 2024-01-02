-- Toggle cmp
vim.api.nvim_create_user_command("CmpToggle", function()
  if vim.g.cmp_toggle == false or vim.g.cmp_toggle == nil then
    vim.g.cmp_toggle = true
    vim.notify "Cmp enabled"
  else
    vim.g.cmp_toggle = false
    vim.notify "Cmp disabled"
  end
end, {
  desc = "Toggle cmp",
})

-- Toggle cmp-rg
vim.api.nvim_create_user_command("CmpRgToggle", function()
  if vim.g.cmp_rg_toggle == false or vim.g.cmp_rg_toggle == nil then
    local cmp = require "cmp"
    local sources = cmp.get_config().sources

    table.insert(sources, { name = "rg" })

    cmp.setup { sources = sources }
    vim.g.cmp_rg_toggle = true
    vim.notify "Cmp-rg enabled"
  else
    local cmp = require "cmp"
    local sources = cmp.get_config().sources

    for i, _ in pairs(sources) do
      if sources[i].name == "rg" then
        table.remove(sources, i)
      end
    end

    cmp.setup { sources = sources }
    vim.g.cmp_rg_toggle = false
    vim.notify "Cmp-rg disabled"
  end
end, {
  desc = "Toggle cmp-rg",
})
