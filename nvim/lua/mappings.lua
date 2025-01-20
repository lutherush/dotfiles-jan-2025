local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Key Mappings
map("n", "<leader>t", ":vsplit | terminal<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)
map("n", "<leader>f", ":Files<CR>", opts)
map("n", "<leader>g", ":Rg<CR>", opts)
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>du", ":lua require('dapui').toggle()<CR>", opts)

-- Folding shortcuts
map("n", "za", "za", opts)
map("n", "zR", "zR", opts)
map("n", "zM", "zM", opts)