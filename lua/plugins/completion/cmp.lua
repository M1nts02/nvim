local cmp = require "cmp"

local icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  EnumMember = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
  Copilot = "",
  Codeium = "",
  TabNine = "",
}

cmp.setup {
  enabled = function()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" or vim.g.cmp_toggle == nil then
      return false
    end
    return vim.g.cmp_toggle
  end,
  completion = {
    keyword_length = 3,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:PMenu,Search:None",
      scrollbar = false,
      border = "rounded",
    },
    documentation = {
      winhighlight = "Normal:PmenuSel,FloatBorder:Pmenu,Search:None",
      scrollbar = false,
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<Esc>"] = cmp.mapping.close(),
    ["<C-c>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<S-CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() and vim.g.cmp_toggle then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      elseif vim.g.cmp_toggle then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) and vim.g.cmp_toggle then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      elseif vim.g.cmp_toggle then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, item)
      item.menu = "    (" .. item.kind .. ")"
      item.kind = " " .. icons[item.kind] .. " "
      return item
    end,
  },
}

-- cmp for search
cmp.setup.cmdline("/", {
  enabled = function()
    local mode = vim.api.nvim_get_mode().mode
    return (mode == "c" and vim.g.cmp_toggle == true) and true or false
  end,
  completion = {
    keyword_length = 1,
  },
  view = { docs = { auto_open = false } },
  sources = {
    { name = "buffer" },
  },
  mapping = {
    ["<C-c>"] = { c = cmp.mapping.close() },
    ["<C-y>"] = {
      c = cmp.mapping.confirm { select = false },
    },
    ["<Tab>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      end,
    },
    ["<S-Tab>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      end,
    },
  },
  formatting = {
    fields = { "abbr" },
    format = function(_, item)
      return item
    end,
  },
})

-- cmp for command line and input
cmp.setup.cmdline({ ":", "@" }, {
  enabled = function()
    local mode = vim.api.nvim_get_mode().mode
    return (mode == "c" and vim.g.cmp_toggle == true) and true or false
  end,
  completion = {
    keyword_length = 2,
  },
  view = { docs = { auto_open = false } },
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
  mapping = {
    ["<C-c>"] = { c = cmp.mapping.close() },
    ["<C-y>"] = {
      c = cmp.mapping.confirm { select = false },
    },
    ["<Tab>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      end,
    },
    ["<S-Tab>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      end,
    },
  },
})
