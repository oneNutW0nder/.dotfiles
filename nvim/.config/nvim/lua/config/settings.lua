--
-- Begin NeoVim Settings
--

local opt = vim.opt
local g = vim.g

-- Disable matching paren highlighting
g.loaded_matchparen = 1

-- General settings
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*", "build", ".git" }
opt.termguicolors = true
-- opt.syntax = "on"
opt.background = "dark"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.scrolloff = 12
opt.sidescrolloff = 12
opt.colorcolumn = "88"
opt.signcolumn = "yes"
opt.number = true
-- opt.relativenumber = true

opt.confirm = true
opt.spell = true
opt.backup = false
opt.writebackup = false
opt.mouse = "a"
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.belloff = "all" -- Just turn the dang bell off

opt.hidden = true
opt.wrap = false
opt.title = true

-- opt.updatetime = 50 -- Setting used by 'ThePrimeagen'
--opt.redrawtime = 10000
opt.showmode = true
opt.cmdheight = 1

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

-- color scheme - vim.cmd settings are from 'ThePrimeagen'
g.gruvbox_contrast_dark = "soft"
g.gruvbox_italic = 1
g.gruvbox_italicize_strings = 0
g.gruvbox_invert_selection = 0
g.gruvbox_invert_signs = 0
vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd [[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]]
-- vim.cmd [[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]]
-- vim.cmd [[ hi CursorLineNR guibg=None ]]
-- vim.cmd [[ highlight Normal guibg=none ]]
-- vim.cmd [[ highlight LineNr guifg=#5eacd3 ]]
-- vim.cmd [[ highlight netrwDir guifg=#5eacd3 ]]
-- vim.cmd [[ highlight qfFileName guifg=#aed75f ]]
-- vim.cmd [[ hi TelescopeBorder guifg=#5eacd ]]

--[[ This is weird and I don't think I like how aggressive this scheme is
g.gruvbox_baby_transparent_mode = 0
g.gruvbox_baby_telescope_theme = 1
g.gruvbox_baby_background_color = "hard"
vim.cmd("colorscheme gruvbox-baby") ]]

-- Another color scheme attempt (this one is supposed to have better treesitter support)
-- vim.g.gruvbox_material_background = "soft" -- soft, medium, hard
-- vim.g.gruvbox_material_foreground = "original" -- material, mix, original
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.cmd("colorscheme gruvbox-material")

-- Status line stuff
opt.laststatus = 3
require("lualine").setup({ options = { theme = "gruvbox" } })

-- Highlight on yank
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
  augroup END
]])
--[[ local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank({timeout = 40})",
  group = yankGrp,
}) ]]

--[[
set cmdheight=2 " Used to make messages display better
set showmode
]] --

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
]] --

----------------------------------------------
