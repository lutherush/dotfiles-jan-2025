-- Ensure Lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Settings (Vim-like Behavior)
vim.opt.compatible = false
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ " -- Marker for wrapped lines
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
vim.opt.foldmethod = "marker" -- Use {{{ and }}} markers for folding
vim.opt.foldlevel = 0         -- Start with all folds closed
vim.opt.foldenable = true     -- Enable folding by default

-- Colorscheme
vim.cmd([[colorscheme laurice]]) -- Load your colorscheme
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]]) -- Match terminal background
vim.cmd([[autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight Folded guifg=#A3BE8C guibg=#3B4252]])
vim.cmd([[highlight FoldColumn guifg=#D8DEE9 guibg=#3B4252]])

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
    },
    -- File Tree: NERDTree
    {
        "preservim/nerdtree",
        cmd = "NERDTreeToggle",
        config = function()
            vim.g.NERDTreeShowHidden = 1
        end,
    },
    -- Git Integration
    {
        "tpope/vim-fugitive",
    },
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
                current_line_blame = true,
            })
        end,
    },
    -- Snippets: LuaSnip
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip").setup({})
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- LSP and Completion
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
            })

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
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
                indent = { char = "│" },
            })
        end,
    },
    -- Whitespace Trimming
    {
        "mcauley-penney/tidy.nvim",
        config = function()
            require("tidy").setup()
        end,
    },
    -- Emmet for HTML/CSS
    "mattn/emmet-vim",
    -- Commentary
    "tpope/vim-commentary",
    -- Language Pack
    "sheerun/vim-polyglot",
})

-- Autocommands
-- Remove trailing whitespace before saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]], -- Match trailing whitespace
})

-- Automatically enter insert mode when opening a terminal
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "terminal" then -- Check if the buffer is a terminal
            vim.cmd("startinsert")
        end
    end,
})

-- Open NERDTree on VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.argc() == 0 then -- No files provided on the command line
            vim.cmd("NERDTree")
            if #vim.api.nvim_list_wins() == 1 then -- Only NERDTree window exists
                vim.cmd("vsplit")
            end
        end
    end,
})

-- Key Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
map("n", "<leader>t", ":vsplit | terminal<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)
map("n", "<leader>f", ":Files<CR>", opts)
map("n", "<leader>g", ":Rg<CR>", opts)
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>du", ":lua require('dapui').toggle()<CR>", opts)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "za", "za", opts) -- Toggle fold under the cursor
map("n", "zR", "zR", opts) -- Open all folds
map("n", "zM", "zM", opts) -- Close all folds
