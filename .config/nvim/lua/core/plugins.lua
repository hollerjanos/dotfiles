-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.lsp.config("clangd", {
  -- You can add custom settings here if you want
  cmd = { "clangd", "--background-index" }, -- example
  on_attach = function(client, bufnr)
    -- Keymaps or other setup can go here
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    -- Add more if you like
  end,
  flags = {
    debounce_text_changes = 150,
  }
})
vim.lsp.enable({"clangd"})

-- local lspconfig = require('lspconfig')
-- lspconfig.clangd.setup {
--   -- You can add custom settings here if you want
--   cmd = { "clangd", "--background-index" }, -- example
--   on_attach = function(client, bufnr)
--     -- Keymaps or other setup can go here
--     local bufopts = { noremap=true, silent=true, buffer=bufnr }
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--     -- Add more if you like
--   end,
--   flags = {
--     debounce_text_changes = 150,
--   }
-- }

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})
