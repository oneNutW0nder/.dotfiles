local M = {}
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- General dependencies
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- This is some popup API thing... Not sure what it is for
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use


  -- Colorscheme
  use {
    "gruvbox-community/gruvbox",
    -- config = function()
    --   vim.g.gruvbox_contrast_dark = "soft"
    --   vim.g.gruvbox_italic = 1
    --   vim.g.gruvbox_italicize_strings = 0
    --   vim.cmd("colorscheme gruvbox")
    -- end,
    disable = true,
  }
  use {
    'luisiacc/gruvbox-baby',
    branch = 'main',
    disable = true,
  }
  use {
    "sainnhe/gruvbox-material",
    config = function()
      -- vim.g.gruvbox_material_foreground = "original"
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_better_performance = 1
      -- vim.g.gruvbox_material_enable_bold = 1
      -- vim.cmd "colorscheme gruvbox-material"
      vim.g.gruvbox_material_palette          = "material"
      vim.g.gruvbox_material_statusline_style = "material"

      vim.g.gruvbox_material_enable_bold   = 1
      vim.g.gruvbox_material_enable_italic = 1

      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text   = 'colored'

      vim.g.gruvbox_material_better_performance     = 1
      vim.g.gruvbox_material_transparent_background = 1

      vim.cmd([[colorscheme gruvbox-material]])

      local function highlight_line_number()
        vim.opt.cursorline = true
        vim.cmd([[ highlight clear CursorLine ]])
      end

      highlight_line_number()

      vim.cmd([[ highlight FloatBorder guibg=NONE ]])
      vim.cmd([[ highlight NormalFloat guibg=NONE ]])

      vim.cmd([[highlight CmpCurrentLine guibg=#a9b665 guifg=#282828]])

      vim.cmd([[highlight! link CmpNormal normal]])
      vim.cmd([[highlight CmpBorder guifg=#5a524c]])

      vim.cmd([[highlight CmpDocNormal guibg=#242322]])
      vim.cmd([[highlight link CmpDocBorder CmpBorder]])

      vim.cmd([[highlight! link FloatBorder CmpBorder]])

      vim.cmd([[highlight VertSplit guifg=#32302f]])

      vim.cmd([[highlight NvimTreeNormal guibg=#242322]])
      vim.cmd([[highlight NvimTreeWinSeparator guibg=#242322 guifg=#242322]])
      vim.cmd([[highlight NvimTreeCursorLine guibg=#2a2a2a]])
      vim.cmd([[highlight! link NvimTreeFolderIcon green]])
      vim.cmd([[highlight! link NvimTreeFolderName green]])

      vim.cmd([[highlight TelescopeNormal guibg=#242322]])
      -- vim.cmd([[highlight TelescopeBorder guifg=#242322 guibg=#242322]])

      -- vim.cmd([[highlight TelescopePromptNormal guibg=#32302f]])
      -- vim.cmd([[highlight elescopePromptBorder guifg=#32302f guibg=#32302f]])
      vim.cmd([[highlight TelescopePromptTitle  guibg=#ea6962 guifg=#242322]])
      vim.cmd([[highlight TelescopePromptPrefix guifg=#ea6962]])

      vim.cmd([[highlight TelescopePreviewTitle guibg=#a9b665 guifg=#242322]])

      vim.cmd([[highlight TelescopeSelection guibg=#32302f guifg=#E3CCA3]])

      vim.cmd([[hi link FloatTitle blue]])
    end,
    disable = false,
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', disable = false }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'nvim-treesitter/playground' }
  use { 'windwp/nvim-ts-autotag' }


  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Text manipulation
  use "numToStr/Comment.nvim"
  use "windwp/nvim-autopairs"

  -- Git stuff
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '≃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
      }
    end
  }

  -- Toggle Term
  use {
    "akinsho/toggleterm.nvim", tag = 'v1.*',
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
          border = "double",
        },
      }
      -- TODO: Make this not terrible
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit" })

      function _lazygit_toggle()
        lazygit:toggle(50, "float")
      end
      vim.api.nvim_set_keymap("n", "<leader>lg", ":lua _lazygit_toggle()<cr>", { noremap = true, silent = true })
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
