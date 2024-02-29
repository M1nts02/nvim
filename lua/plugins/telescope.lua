local keys = {
  { "<Space>f<CR>", "<CMD>Telescope<CR>", desc = "Telescope" },
  { "<Space>ff", "<CMD>Telescope find_files<CR>", desc = "File" },
  { "<Space>fb", "<CMD>Telescope buffers<CR>", desc = "Buffer" },
  { "<Space>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
  { "<Space>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fm", "<CMD>Telescope marks<CR>", desc = "Marks" },
  { "<Space>fc", "<CMD>Telescope commands<CR>", desc = "Command" },
  { "<Space>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Line" },
  { "<Space>lS", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "Symbol Workspace" },
  { "z=", "<CMD>Telescope spell_suggest<CR>", desc = "spell suggest" },
  { "<M-x>", "<CMD>Telescope commands<CR>" },
}

local options = {
  defaults = {
    prompt_prefix = "   ",
    default = { COLORTERM = "truecolor" },
    file_ignore_patterns = { "./.git/*" },
    preview = false,
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.6,
      preview_cutoff = 120,
      horizontal = {
        height = 0.8,
        preview_width = 0.45,
        prompt_position = "top",
        width = 0.6,
      },
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  keys = keys,
  main = "telescope",
  opts = options,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- Session
      "rmagatti/session-lens",
      keys = { { "<Space>fs", "<CMD>Telescope session-lens search_session<CR>", desc = "Sessions" } },
      config = function()
        require("telescope").load_extension "session-lens"
      end,
      dependencies = {
        {
          "rmagatti/auto-session",
          main = "auto-session",
          opts = {},
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end,
}
