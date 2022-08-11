--
-- LSP Config
--

local telescope = require("telescope.builtin")

-- Menu stuff
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }


-- Lspkind
local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end
lspkind.init()

-- Function for 'super tabbing'
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup nvim-cmp.
local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    -- TODO: Make better keybinds for completion and snippet traversal... Overloading tab this much is toxic
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
  },
  {
    { name = 'nvim_lsp_signature_help' },
  },
  {
    { name = 'spell', keyword_length = 4 },
    { name = 'buffer', keyword_length = 6 },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = "[lsp]",
        nvim_lua = "[lua_api]",
        luasnip = "[snip]",
        path = "[path]",
        spell = "[spell]",
        buffer = "[buffer]",
        cmdline = "[cmd]",
      },
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  view = {},
  experimental = {
    ghost_text = false,
  },
}

-- Completion for command line
cmp.setup.cmdline("/", {
  sources = cmp.config.sources({
    { name = "buffer" },
  })
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
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


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local custom_on_attach = function(client)

  -- Mappings
  local opts = { noremap = true, silent = true, buffer = 0 }

  -- TODO --> Make these work with telescope where it makes sense
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Sets keymap for current buffer in normal mode 'K'
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
  vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
  vim.keymap.set("n", "gr", telescope.lsp_references, opts)
  vim.keymap.set("n", "gt", telescope.lsp_type_definitions, opts)
  vim.keymap.set("n", "<leader>o", telescope.treesitter, opts)
  vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.api.nvim_set_keymap("n", "<leader>da", "<cmd>Telescope diagnostics bufnr=0<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)

  -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0})
  -- if client.resolved_capabilities.document_highlight then
  --   vim.cmd [[
  --     hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightYellow
  --     hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightYellow
  --     hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
  --   ]]
  --   vim.api.nvim_create_augroup('lsp_document_highlight', {})
  --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  --     group = 'lsp_document_highlight',
  --     buffer = 0,
  --     callback = vim.lsp.buf.document_highlight,
  --   })
  --   vim.api.nvim_create_autocmd('CursorMoved', {
  --     group = 'lsp_document_highlight',
  --     buffer = 0,
  --     callback = vim.lsp.buf.clear_references,
  --   })
  -- end

  -- Set autocommands conditional on server_capabilities
  -- TODO: These are broken AF
  -- if client.server_capabilities.document_formatting then
  --   vim.cmd([[
  -- 	augroup formatting
  -- 		autocmd! * <buffer>
  -- 		autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
  -- 		autocmd BufWritePre <buffer> lua OrganizeImports(1000)
  -- 	augroup END
  -- ]] )
  -- end
  --
  -- -- TODO: These are broken AF
  -- if client.server_capabilities.document_highlight then
  --   vim.cmd([[
  -- 	augroup lsp_document_highlight
  -- 		autocmd! * <buffer>
  -- 		autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  -- 		autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  -- 	augroup END
  -- ]] )
  -- end

end

-- Borders for hover/signature_help
-- TODO: Figure out if borders are good vs changing the LSP background
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "single"
}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "single"
}
)

-- Auto pairs
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

--
-- Configure LSP Servers
--
lsp_installer.setup {}
local lspconfig = require("lspconfig")

--
-- Golang
--
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- Python
--
lspconfig.pylsp.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- Rust
--
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- C / C++
--
lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {
    cmd = { "/Users/onenutw0nder/.local/share/llvm/bin/clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
      "--fallback-style=llvm",
      "--header-insertion=iwyu",
      "--header-insertion-decorators",
      "--suggest-missing-includes",
    },
  },
  flags = {},
}

--
-- PHP
--
lspconfig.intelephense.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- JS / Typescript
--
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- Json
--
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- HTML
--
lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- Docker
--
lspconfig.dockerls.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- TOML
--
lspconfig.taplo.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {
    cmd = "/Users/onenutw0nder/.cargo/bin/taplo lsp stdio",
  },
  flags = {},
}

--
-- Vim
--
lspconfig.cmake.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- Vim
--
lspconfig.vimls.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {},
  flags = {},
}

--
-- Lua
--
-- I think there might be something whack with this server... it loads so slow and misses some things
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
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
