--
-- Keybinds
--

-- Set leader to space
vim.g.mapleader = ' '

-- shorthand for setting keymaps
local mapper = vim.keymap.set
local opts = { noremap = true, silent = true }

mapper( "", "<leader>h", ":nohlsearch<cr>", opts )

-- Faster sourcing of current file
mapper( "n", "<leader>so", ":so %<cr>", { noremap = true, silent = false } )

-- Better window navigation
mapper( "n", "<C-l>", "<C-w>l", opts )
mapper( "n", "<C-h>", "<C-w>h", opts )
mapper( "n", "<C-k>", "<C-w>k", opts )
mapper( "n", "<C-j>", "<C-w>j", opts )

-- Reselect visual selection after indenting
mapper( "v", "<", "<gv", opts )
mapper( "v", ">", ">gv", opts )

-- Make 'Y' behave like other capitol letters
mapper( "", "Y", "y$", opts )

-- Allow gf to open non-existent files
mapper( "", "gf", ":edit <cfile><cr>", opts )

-- search matches in the middle of the window
mapper("n", "n", "nzzzv", opts )
mapper("n", "N", "Nzzzv", opts )

-- Telesoope binds
local telescope = require( "telescope.builtin")

-- Grep for a string globally and allow filtering of results in telescope
vim.api.nvim_set_keymap( "n", "<leader>ss", ":lua require('telescope.builtin').grep_string({search = vim.fn.input('Grep for > ')})<cr>", opts )

-- Grep for string under the cursor and filter with telescope
vim.api.nvim_set_keymap( "n", "<leader>sw", ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<cr>", opts )


mapper( "n", "<leader>sa", telescope.current_buffer_fuzzy_find, opts )
mapper( "n", "<leader>sf", telescope.find_files, opts ) -- Find files from starting point of vim
mapper( "n", "<leader>sg", telescope.git_files, opts ) -- Find files in Git repo
mapper( "n", "<leader>sb", telescope.buffers, opts )
mapper( "n", "<leader>sl", telescope.live_grep, opts )
mapper( "n", "<leader>fl", telescope.quickfix, opts )
mapper( "n", "<leader>vh", telescope.help_tags, opts )
mapper( "n", "<leader>tla", telescope.builtin, opts )

