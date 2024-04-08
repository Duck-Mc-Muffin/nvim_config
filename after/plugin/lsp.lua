local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

-- Keybinds on "attach"
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>vn", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>vN", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrq", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() require('telescope.builtin').lsp_references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Mason LSPs
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(opts)
    end,
  }
})

-- "Vanilla" LSPs
lsp_config.glsl_analyzer.setup({}) -- GLSL INSTALLIEREN: https://github.com/nolanderc/glsl_analyzer/releases

-- Auto format
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['rust_analyzer'] = {'rust'},
  }
})

-- Auto format after leaving INSERT for specific files
vim.api.nvim_create_autocmd('InsertLeave', { -- TODO: use some LSP-Hook?
	desc = 'Saves the file after leaving INSERT.',
	group = vim.api.nvim_create_augroup('save_file_after_insert', {}),
	callback = function (opts)
		if vim.bo[opts.buf].filetype == 'rust' then
            local tmp = vim.g.rustfmt_fail_silently
            vim.g.rustfmt_fail_silently = 1
			vim.cmd('RustFmt')
            vim.g.rustfmt_fail_silently = tmp
		end
	end,
})

-- Auto complete
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
