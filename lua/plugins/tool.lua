return {
  -- Session
  {
    "nvimdev/dbsession.nvim",
    cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
    opts = {},
  },

  -- Rg
  {
    "duane9/nvim-rg",
    cmd = "Rg",
    keys = {
      {
        "<Space>fg",
        function()
          local arg = vim.fn.input "Grep: "

          if arg == "" or arg == nil then
            return
          end

          if vim.fn.executable "Rg" == 1 then
            vim.cmd("Rg " .. arg)
            return
          end

          vim.cmd("vimgrep /" .. arg .. "/gj **")
          vim.cmd "copen"
        end,
        desc = "Grep",
      },
    },
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Color highlighting
  {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers", "ColorizerToggle" },
    main = "colorizer",
    opts = {},
  },

  -- Search
  {
    "ibhagwan/fzf-lua",
    cmd = { "FzfLua" },
    keys = {
      { "<Space>f<CR>", "<CMD>FzfLua builtin<CR>", desc = "Builtin" },
      { "<Space>ff", "<CMD>FzfLua files<CR>", desc = "File" },
      { "<Space>fo", "<CMD>FzfLua oldfiles<CR>", desc = "Oldfile" },
      { "<Space>fm", "<CMD>FzfLua marks<CR>", desc = "Marks" },
      { "<Space>lS", "<CMD>FzfLua lsp_workspace_symbols<CR>", desc = "Symbol Workspace" },
      { "<Space>f/", "<CMD>FzfLua lines<CR>", desc = "Buffers line" },
      { "<Space>/", "<CMD>FzfLua blines<CR>", desc = "Line" },
      {
        "<Space>fh",
        function()
          require("fzf-lua").help_tags {
            winopts = {
              height = 0.5,
              width = 0.7,
              preview = { hidden = "hidden" },
            },
          }
        end,
        desc = "Help",
      },
      {
        "z=",
        function()
          require("fzf-lua").spell_suggest {
            winopts = {
              height = 0.6,
              width = 0.4,
            },
          }
        end,
        desc = "spell suggest",
      },
      {
        "<A-x>",
        function()
          require("fzf-lua").commands {
            winopts = {
              height = 0.5,
              width = 0.5,
              preview = { hidden = "hidden" },
            },
          }
        end,
        desc = "Commands",
      },
    },
    opts = {
      winopts = {
        height = 0.7,
        width = 0.8,
        preview = {
          default = function()
            if vim.fn.executable "bat" == 1 then
              return "bat"
            end
            return "builtin"
          end,
          horizontal = "right:50%",
          scrollbar = false,
        },
      },
      fzf_colors = {
        ["fg"] = { "fg", "CursorLine" },
        ["bg"] = { "bg", "Normal" },
        ["hl"] = { "fg", "Comment" },
        ["fg+"] = { "fg", "Normal" },
        ["bg+"] = { "bg", "CursorLine" },
        ["hl+"] = { "fg", "Statement" },
        ["info"] = { "fg", "PreProc" },
        ["prompt"] = { "fg", "Directory" },
        ["pointer"] = { "fg", "Exception" },
        ["marker"] = { "fg", "SpecialKey" },
        ["spinner"] = { "fg", "WarningMsg" },
        ["header"] = { "fg", "Comment" },
        ["gutter"] = { "bg", "Normal" },
      },
      previewers = {
        builtin = {
          treesitter = { enable = false },
          extensions = {
            ["png"] = { "viu", "-b" },
            ["svg"] = { "chafa", "{file}" },
            ["jpg"] = { "viu", "-b" },
          },
        },
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "junegunn/fzf",
        enabled = vim.fn.executable "fzf" ~= 1,
        build = "./install --bin",
      },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    keys = { [[<C-\>]] },
    main = "toggleterm",
    opts = {
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      autochdir = false,
      start_in_insert = true,
      direction = "float",
      close_on_exit = true,
      auto_scroll = true,
      float_opts = { border = "curved" },
      winbar = { enabled = false },
    },
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = { { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" } },
    main = "neogit",
    opts = { integrations = { diffview = true } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    keys = {
      { "<Space>gg", "<CMD>Gitsigns toggle_signs<CR>", desc = "Gitsigns" },
      { "<Space>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", desc = "Gitsigns blame" },
      { "<Space>gd", "<CMD>Gitsigns diffthis<CR>", desc = "Diff" },
      { "<Space>g<Cr>", "<CMD>Gitsigns refresh<CR>", desc = "Gitsigns refresh" },
    },
    main = "gitsigns",
    opts = { signcolumn = false },
  },

  -- Buffer manager
  {
    "j-morano/buffer_manager.nvim",
    keys = {
      {
        "<Space>b",
        function()
          require("buffer_manager.ui").toggle_quick_menu()
        end,
        desc = "Buffer manager",
      },
    },
    main = "buffer_manager",
    opts = {},
  },

  -- Workspace manager
  {
    "natecraddock/workspaces.nvim",
    cmd = {
      "WorkspacesAdd",
      "WorkspacesAddDir",
      "WorkspacesList",
      "WorkspacesListDirs",
      "WorkspacesOpen",
      "WorkspacesRemove",
      "WorkspacesRemoveDir",
      "WorkspacesRename",
      "WorkspacesSyncDirs",
    },
    keys = { { "<Space>fw", "<CMD>WorkspacesOpen<CR>", desc = "Workspace" } },
    main = "workspaces",
    opts = {
      path = require("core.utils").path_join(vim.fn.stdpath "data", "workspaces"),
      cd_type = "global",
      sort = true,
      mru_sort = true,
      notify_info = true,
      hooks = {},
    },
  },
}
