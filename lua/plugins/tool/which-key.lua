local M = {}

M.keys = { "c", "d", "g", "v", "y", "z", "<Space>", "\\" }

local options = {
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "",
  },
  layout = {
    height = {
      min = 2,
      max = 6,
    },
    align = "center",
  },
  plugins = {
    spelling = {
      enabled = false,
    },
  },
}

local rg = {
  -- Quit
  ["<Space>q"] = { "<CMD>q<CR>", "quit" },

  -- Tab
  ["<Space><tab>"] = { name = "Tab+" },
  ["<Space><tab><tab>"] = { "<CMD>tabs<CR>", "Tabs" },
  ["<Space><tab>n"] = { "<CMD>tabnext<CR>", "Tab Next" },
  ["<Space><tab>p"] = { "<CMD>tabprevious<CR>", "Tab Prev" },
  ["<Space><tab>e"] = { "<CMD>tabedit<CR>", "Tab Edit" },
  ["<Space><tab>1"] = { "<CMD>tabnext 1<CR>", "Tab Edit" },
  ["<Space><tab>2"] = { "<CMD>tabnext 2<CR>", "Tab Edit" },
  ["<Space><tab>3"] = { "<CMD>tabnext 3<CR>", "Tab Edit" },
  ["<Space><tab>4"] = { "<CMD>tabnext 4<CR>", "Tab Edit" },
  ["<Space><tab>5"] = { "<CMD>tabnext 5<CR>", "Tab Edit" },
  ["<Space><tab>6"] = { "<CMD>tabnext 6<CR>", "Tab Edit" },
  ["<Space><tab>7"] = { "<CMD>tabnext 7<CR>", "Tab Edit" },
  ["<Space><tab>8"] = { "<CMD>tabnext 8<CR>", "Tab Edit" },
  ["<Space><tab>9"] = { "<CMD>tabnext 9<CR>", "Tab Edit" },

  -- Window
  ["<Space>w"] = { "<C-w>", "Windows+" },

  -- Visual
  ["v"] = { name = "Visual+", ["v"] = { "v", "Visual Mode" }, ["b"] = { "<C-v>", "Visual Block" } },

  -- Debug
  ["<Space>d"] = { name = "Debug+" },

  -- Git
  ["<Space>g"] = { name = "Git+" },

  -- LSP
  ["<Space>l"] = {
    name = "LSP+",
  },

  -- Telescope
  ["<Space>f"] = { name = "Find+" },

  -- Color
  ["<Space>p"] = { name = "Preview+" },
}

M.config = function()
  require("which-key").setup(options)
  require("which-key").register(rg)
end

return M
