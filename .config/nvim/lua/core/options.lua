vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cursorline = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 5

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        vim.opt.colorcolumn = { "50", "80" }
    end
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vim.opt.colorcolumn = ""
    end
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- could be '●', '▎', '■', or any symbol you like
    spacing = 4,
  },
  signs = true,         -- show signs in the gutter (left column)
  underline = true,     -- underline errors/warnings in the code
  update_in_insert = false, -- don't update diagnostics while typing
})

vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",      -- Show tabs as "→ "
  space = "·",     -- Show spaces as "·"
  trail = "•",     -- Trailing spaces
  extends = "⟩",   -- Character when text overflows right
  precedes = "⟨",  -- Character when text overflows left
  nbsp = "␣",      -- Non-breaking space
}
