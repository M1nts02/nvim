local M = {}

M.keys = {
  { "<Space>f<CR>", "<CMD>Telescope<CR>", desc = "Telescope" },
  { "<Space>ff", "<CMD>Telescope find_files<CR>", desc = "File" },
  { "<Space>fb", "<CMD>Telescope buffers<CR>", desc = "Buffer" },
  { "<Space>fg", "<CMD>Telescope live_grep<CR>", desc = "Grep" },
  { "<Space>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
  { "<Space>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fm", "<CMD>Telescope marks<CR>", desc = "Marks" },
  { "<Space>fc", "<CMD>Telescope commands<CR>", desc = "Command" },
  { "<Space>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Line" },
  { "<Space>ld", "<CMD>Telescope lsp_definitions<CR>", desc = "Definition" },
  { "<Space>lr", "<CMD>Telescope lsp_references<CR>", desc = "References" },
  { "<Space>le", "<CMD>Telescope diagnostics<CR>", desc = "Diagnostics" },
  { "<Space>li", "<CMD>Telescope lsp_implementations<CR>", desc = "Implementations" },
  { "<Space>lw", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "Symbol Workspace" },
  { "<Space>ls", "<CMD>Telescope lsp_document_symbols<CR>", desc = "Symbol" },
  { "z=", "<CMD>Telescope spell_suggest<CR>", desc = "spell suggest" },
  { "gd", "<CMD>Telescope lsp_definitions<CR>", desc = "Definition" },
  { "<M-x>", "<CMD>Telescope commands<CR>" },
}

M.options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    default = { COLORTERM = "truecolor" },
    file_ignore_patterns = { "./.git/*" },
    preview = true,
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.8,
      preview_cutoff = 120,
      horizontal = {
        height = 0.8,
        preview_width = 0.45,
        prompt_position = "top",
        width = 0.8,
      },
    },
  },
}

return M
