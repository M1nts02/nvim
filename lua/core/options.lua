local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g
local o = vim.o

o.wildignorecase = true
o.writebackup = false
o.swapfile = false
o.shiftround = true
o.ignorecase = true
o.smartcase = true
o.infercase = true
o.incsearch = false
o.splitbelow = true
o.splitright = true
o.showmode = false
o.ruler = false
o.list = true
o.showcmd = true
o.timeoutlen = 100
o.scrolloff = 5
o.foldlevelstart = 99
o.showtabline = 0
o.pumheight = 15
o.laststatus = 3
o.pumblend = 0
o.winblend = 0
o.helpheight = 80
o.cmdheight = 1
o.mouse = "nvic"
o.virtualedit = "block"
o.encoding = "utf-8"
o.foldmethod = "indent"
o.clipboard = "unnamedplus"
o.inccommand = "nosplit"
o.switchbuf = "useopen"
o.backspace = "indent," .. "eol," .. "start"
o.showbreak = "+---"
o.listchars = "tab:»·," .. "nbsp:+," .. "trail:·," .. "extends:→," .. "precedes:←"
o.omnifunc = "syntaxcomplete#Complete"

opt.undofile = true
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = true
opt.termguicolors = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = -1
opt.whichwrap:append "<>[]hl"
opt.fillchars = { eob = " " }

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = "\\"
g.python3_host_prog = vim.g.python

cmd "set shortmess+=c"
cmd "unmenu PopUp"

-- Add env for mason
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (vim.g.is_windows and ";" or ":") .. vim.env.PATH
