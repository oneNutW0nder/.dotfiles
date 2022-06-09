--
-- Keybinds
--

-- Set leader to space
vim.g.mapleader = ' '

-- shorthand for setting keymaps
local mapper = vim.keymap.set
local opts = { noremap = true, silent = true }

mapper("", "<leader>h", ":nohlsearch<cr>", opts )

-- Better window navigation
mapper("n", "<C-l>", "<C-w>l", opts )
mapper("n", "<C-h>", "<C-w>h", opts )
mapper("n", "<C-k>", "<C-w>k", opts )
mapper("n", "<C-j>", "<C-w>j", opts )

-- Reselect visual selection after indenting
mapper("v", "<", "<gv", opts )
mapper("v", ">", ">gv", opts )

-- Make 'Y' behave like other capitol letters
mapper("", "Y", "y$", opts )

-- Allow gf to open non-existent files
mapper("", "gf", ":edit <cfile><cr>", opts )

-- search matches in the middle of the window
mapper('n', 'n', 'nzzzv', opts )
mapper('n', 'N', 'Nzzzv', opts )

-- Telescope binds
local telescope = require("telescope.builtin")

-- Grep for a string globally and allow filtering of results in telescope
vim.api.nvim_set_keymap("n", "<leader>ss", ":lua require('telescope.builtin').grep_string({search = vim.fn.input('Grep for > ')})<cr>", opts )

-- Grep for string under the cursor and filter with telescope
vim.api.nvim_set_keymap("n", "<leader>sw", ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<cr>", opts )

mapper("n", "<leader>sf", telescope.find_files, opts )
mapper("n", "<leader>sb", telescope.buffers, opts )
mapper("n", "<leader>sg", telescope.git_files, opts )
mapper("n", "<leader>fl", telescope.quickfix, opts )
