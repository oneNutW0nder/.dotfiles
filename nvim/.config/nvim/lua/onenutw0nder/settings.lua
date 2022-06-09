--
-- Begin NeoVim Settings
--

local opt = vim.opt
local g = vim.g

g.gruvbox_contrast_dark = "hard"
vim.cmd("colorscheme gruvbox")

opt.termguicolors = true
opt.syntax = "on"
opt.background = "dark"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.scrolloff = 12
opt.sidescrolloff = 12
opt.number = true
-- opt.relativenumber = true
opt.colorcolumn = "88"
opt.signcolumn = "yes"

opt.confirm = true
opt.spell = true
opt.backup = false
opt.writebackup = false
opt.mouse = "a"

opt.hidden = true
opt.wrap = false
opt.title = true

opt.updatetime = 1000
--opt.redrawtime = 10000
opt.showmode = true
opt.cmdheight = 2

-- Cursorline highlighting control
--  Only have it on in the active buffer
opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

--[[
set cmdheight=2 " Used to make messages display better
set showmode
]]--

-- Lots from TJ: https://github.com/tjdevries/config_manager/blob/1a93f03dfe254b5332b176ae8ec926e69a5d9805/xdg_config/nvim/plugin/options.lua

--[[
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*", "build", ".git" }

opt.wildmode = "longest:list:full"
opt.wildoptions = "pum"

opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 2 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = false -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor


-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"
opt.swapfile = false -- Living on the edge
opt.inccommand = 'split'
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

opt.fillchars = { eob = "~" }

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

--
-- End NeoVim Settings
--
]]--

----------------------------------------------

