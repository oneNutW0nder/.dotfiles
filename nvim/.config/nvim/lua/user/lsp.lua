--
-- LSP Config
--

-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- TODO --> Make these work
-- nmap{"C-f", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>"}
-- nmap{"<leader>lg", "<cmd>Telescope live_grep<CR>"}


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings
  local opts = { noremap = true, silent = true}

  -- TODO --> Make these work with telescope where it makes sense
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0}) -- Sets keymap for current buffer in normal mode 'K'
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {buffer = 0})
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {buffer = 0})
  vim.keymap.set("n", "<space>dj", vim.diagnostic.goto_next, {buffer = 0})
  vim.keymap.set("n", "<space>dk", vim.diagnostic.goto_prev, {buffer = 0})

	-- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_formatting then
		vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]])
	end

	if client.server_capabilities.document_highlight then
		vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
	end

end


-- Configure LSP Servers
lsp_installer.setup{}
local lspconfig = require("lspconfig")

-- Golang
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {},
  flags = {},
}

-- Lua
lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
