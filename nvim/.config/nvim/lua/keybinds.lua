--
-- Keybinds
--

-- Set leader to space
vim.g.mapleader = ' '

-- shorthand for setting keymaps
local mapper = vim.api.nvim_set_keymap

mapper("", "<leader>h", ":nohlsearch<cr>", { silent = true } )

-- Better window navigation
mapper("n", "<C-l>", "<C-w>l", { noremap = true, silent = true } )
mapper("n", "<C-h>", "<C-w>h", { noremap = true, silent = true } )
mapper("n", "<C-k>", "<C-w>k", { noremap = true, silent = true } )
mapper("n", "<C-j>", "<C-w>j", { noremap = true, silent = true } )

-- Reselect visual selection after indenting
mapper("v", "<", "<gv", { noremap = true, silent = true } )
mapper("v", ">", ">gv", { noremap = true, silent = true } )

-- Make 'Y' behave like other capitol letters
mapper("", "Y", "y$", { noremap = true, silent = true } )

-- Allow gf to open non-existent files
mapper("", "gf", ":edit <cfile><cr>", { silent = true } )

