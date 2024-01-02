local M = {}
local Hydra = require "hydra"

-- DAP
M.debug = {
  name = "DEBUG",
  hint = [[
    _c_: Continue     _s_: StepOver        _o_: StepOut
    _b_: Breakpoint   _n_: StepInto
     ^                                                     ]],
  config = {
    color = "pink",
    invoke_on_body = false,
    hint = {
      border = "rounded",
    },
  },
  mode = "n",
  body = "<Space>d",
  heads = {
    { "c", "<CMD>DapContinue<CR>", { desc = "Continue" } },
    { "b", "<CMD>DapToggleBreakpoint<CR>", { desc = "Breakpoint" } },
    { "s", "<CMD>DapStepOver<CR>", { desc = "StepOver" } },
    { "n", "<CMD>DapStepInto<CR>", { desc = "StepInto" } },
    { "o", "<CMD>DapStepOut<CR>", { desc = "StepOut" } },
  },
}

-- Options
M.options = {
  name = "Options",
  hint = [[
    ^ ^                   OPTIONS
    ^
    _l_ %{get_lsp} LSP

    _f_ %{get_auto_format} Auto format

    _c_ %{get_cmp} Auto completion

    _g_ %{get_cmp_rg} Ripgrep for completion

    _b_ %{get_line_blame} Line blame

    _s_ %{get_gitsigns} Gitsigns

    _n_ %{get_number} Number

    _r_ %{get_relativenumber} Relativenumber

    _t_ %{get_dark_mode} Dark mode

    ^
         ^^^^                _<Esc>_
                                                           ]],
  config = {
    color = "amaranth",
    invoke_on_body = true,
    hint = {
      border = "single",
      position = "middle",
      funcs = {
        ["get_lsp"] = function()
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return "[ ]"
          else
            return "[x]"
          end
        end,
        ["get_auto_format"] = function()
          if vim.g.auto_format_id == nil then
            return "[ ]"
          else
            return "[x]"
          end
        end,
        ["get_cmp"] = function()
          if vim.g.cmp_toggle == false or vim.g.cmp_toggle == nil then
            return "[ ]"
          else
            return "[x]"
          end
        end,
        ["get_cmp_rg"] = function()
          if vim.g.cmp_rg_toggle == false or vim.g.cmp_rg_toggle == nil then
            return "[ ]"
          else
            return "[x]"
          end
        end,
        ["get_line_blame"] = function()
          local line_blame = require("gitsigns.config").config.current_line_blame
          if line_blame == false or line_blame == nil then
            return "[ ]"
          else
            return "[x]"
          end
        end,
        ["get_gitsigns"] = function()
          local signcolumn = require("gitsigns.config").config.signcolumn
          if signcolumn == false or signcolumn == nil then
            return "[ ]"
          else
            return "[x]"
          end
        end,
        ["get_number"] = function()
          if vim.opt.number:get() then
            return "[x]"
          else
            return "[ ]"
          end
        end,
        ["get_relativenumber"] = function()
          if vim.opt.relativenumber:get() then
            return "[x]"
          else
            return "[ ]"
          end
        end,
        ["get_dark_mode"] = function()
          local theme = require "core.toggle_theme"
          local dark_mode = theme.get_dark_mode()
          if dark_mode then
            return "[x]"
          else
            return "[ ]"
          end
        end,
      },
    },
  },
  mode = "n",
  body = "\\",
  heads = {
    {
      "l",
      function()
        vim.cmd "LspToggle"
      end,
      { desc = "LSP toggle" },
    },
    {
      "f",
      function()
        vim.cmd "AutoFormatToggle"
      end,
      { desc = "Toggle auto-format" },
    },
    {
      "c",
      function()
        vim.cmd "CmpToggle"
      end,
      { desc = "Toggle cmp" },
    },
    {
      "g",
      function()
        vim.cmd "CmpRgToggle"
      end,
      { desc = "Toggle cmp-rg" },
    },
    {
      "b",
      function()
        vim.cmd "Gitsigns toggle_current_line_blame"
      end,
      { desc = "Toggle line blame" },
    },
    {
      "s",
      function()
        vim.cmd "Gitsigns toggle_signs"
      end,
      { desc = "Toggle gitsigns" },
    },
    {
      "n",
      function()
        vim.cmd "tabdo windo set number!"
      end,
      { desc = "Toggle number" },
    },
    {
      "r",
      function()
        vim.cmd "tabdo windo set relativenumber!"
      end,
      { desc = "Toggle relativenumber" },
    },
    {
      "t",
      function()
        vim.cmd "ToggleTheme"
      end,
      { desc = "Toggle dark mode" },
    },
  },
}

for _, v in pairs(M) do
  Hydra(v)
end
