local options = {
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  showtabline = 2,                         -- always show tabs
  expandtab = true,                        -- convert tabs to spaces
  smartindent = true,                      -- make indenting smarter again
  scrolloff = 12,                           -- is one of my fav
  sidescrolloff = 12,

  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                        -- creates a swapfile
  undofile = true,                         -- enable persistent undo

  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)

  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  mouse = "a",                             -- allow the mouse to be used in neovim
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  spell = true,

  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  pumheight = 10,                          -- pop up menu height

  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  hlsearch = true,                         -- highlight all matches on previous search pattern

  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  wrap = false,                            -- display lines as one long line
  fileencoding = "utf-8",                  -- the encoding written to a file
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("colorscheme gruvbox")

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
