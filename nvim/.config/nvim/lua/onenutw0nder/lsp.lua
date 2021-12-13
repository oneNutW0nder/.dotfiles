-- ==============================
--
-- Configuration for native LSP using nvim-cmp for completion
-- =============================

-- Create set of local capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()


-- ==============================
-- nvim-cmp Configuration
-- ==============================

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    -- snippet = {
    --   -- REQUIRED - you must specify a snippet engine
    --   expand = function(args)
    --     require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --   end,
    -- },
    mapping = {
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-CR>'] = cmp.mapping.complete({ sources = { { name = "luasnip" } }}),
      ['<CR>'] = cmp.mapping.confirm(),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
    })
})



-- ==============================
-- Enable Language Servers
-- ==============================

-- Allows us to call `config()` when enabling a lang server
-- and pass an optional config strut for the lang server
-- otherwise it is empty and takes on default values
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end


require('lspconfig').pyright.setup{config()}
require('lspconfig').clangd.setup{config()}
