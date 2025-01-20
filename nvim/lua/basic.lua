-- Basic Settings
vim.opt.compatible = false
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
vim.opt.cursorline = false
vim.opt.expandtab = false
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.background = "dark"
vim.g.mapleader = ","

-- Folding settings
vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.foldenable = true

-- Colorscheme
vim.cmd([[colorscheme laurice]])
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight Folded guifg=#A3BE8C guibg=#3B4252]])
vim.cmd([[highlight FoldColumn guifg=#D8DEE9 guibg=#3B4252]])