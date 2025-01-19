-- Ensure Lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- Latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Settings (Vim-like Behavior)
vim.opt.compatible = false        -- Disable compatibility mode
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.number = true             -- Absolute line numbers
vim.opt.relativenumber = false    -- Disable relative numbers
vim.opt.wrap = true               -- Enable line wrapping
vim.opt.linebreak = true          -- Avoid breaking words mid-word
vim.opt.showbreak = "↪ "          -- Add a marker for wrapped lines
vim.opt.scrolloff = 0             -- No vertical padding
vim.opt.sidescrolloff = 0         -- No horizontal padding
vim.opt.cursorline = false        -- Disable cursorline
vim.opt.expandtab = false         -- Use tabs instead of spaces
vim.opt.tabstop = 8               -- Tab size matches Vim default
vim.opt.shiftwidth = 8            -- Indentation width
vim.opt.ignorecase = true         -- Case-insensitive search
vim.opt.smartcase = true          -- Smart case search
vim.opt.splitbelow = true         -- Split windows below
vim.opt.splitright = true         -- Split windows right
vim.opt.background = "dark"       -- Match Vim’s background behavior
vim.g.mapleader = ","             -- Leader key

-- Set Your Custom Colorscheme
vim.cmd([[colorscheme laurice]])

-- Plugins with Lazy.nvim
require("lazy").setup({
    -- Fuzzy Finder: FZF
    {
        "junegunn/fzf",
        build = ":call fzf#install()",
    },
    {
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf" },
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>f", ":Files<CR>", { noremap = true, silent = true }) -- File search
            vim.api.nvim_set_keymap("n", "<leader>g", ":Rg<CR>", { noremap = true, silent = true }) -- Content search
        end,
    },

    -- File Tree: NERDTree with hidden files
    {
        "preservim/nerdtree",
        cmd = "NERDTreeToggle",
        config = function()
            vim.g.NERDTreeShowHidden = 1 -- Show hidden files
        end,
    },

    -- Git Integration: vim-fugitive
    {
        "tpope/vim-fugitive", -- Git commands in Neovim
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true }) -- Git status
        end,
    },

    -- Git Visualizer: gitsigns.nvim
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                current_line_blame = true, -- Show blame for the current line
            })
        end,
    },

    -- Snippets: LuaSnip
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip").setup({})
        end,
    },

    -- Tagbar for tags and symbols
    {
        "preservim/tagbar",
        cmd = "TagbarToggle",
        config = function()
            vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>", { noremap = true, silent = true })
        end,
    },

    -- Bufferline for buffer navigation
    {
        "akinsho/bufferline.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp", -- Show diagnostics in the bufferline
                },
            })
        end,
    },

    -- Rainbow Parentheses
    {
        "p00f/nvim-ts-rainbow",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter.configs").setup({
                rainbow = { enable = true, extended_mode = true },
            })
        end,
    },

    -- Indent Guides
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                },
                scope = {
                    enabled = false,
                },
            })
        end,
    },

    -- Better Whitespace
    {
        "mcauley-penney/tidy.nvim",
        config = function()
            require("tidy").setup()
        end,
    },

    -- HTML/CSS: Emmet
    "mattn/emmet-vim",

    -- Commentary
    "tpope/vim-commentary",

    -- Language Pack
    "sheerun/vim-polyglot",
})

-- Autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e", -- Strip trailing whitespace
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = [[if &buftype == 'terminal' | startinsert | endif]], -- Auto start insert mode in terminal
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "NERDTree | wincmd p", -- Open NERDTree on startup
})

-- Key Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>e", ":NERDTreeToggle<CR>", opts) -- Toggle NERDTree
map("n", "<leader>t", ":terminal<CR>", opts)       -- Open terminal
map("n", "<leader>q", ":q<CR>", opts)             -- Quit
map("n", "<leader>tn", ":tabnew<CR>", opts)       -- New tab
map("n", "<leader>tc", ":tabclose<CR>", opts)     -- Close tab
map("n", "<leader>f", ":Files<CR>", opts)         -- FZF File Finder
map("n", "<leader>g", ":Rg<CR>", opts)            -- FZF Content Finder
map("n", "<leader>gs", ":Git<CR>", opts)          -- Git Status
