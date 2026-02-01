local funcs = require("utils.functions")

vim.g.mapleader = " "

vim.keymap.set("i", "<S-Tab>", "<C-d>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.keymap.set(
    "n",
    "<leader>ah",
    funcs.switch_source_header,
    {
        desc = "Switch between Source and Header file."
    }
)
