return {
    -- Theme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    comments = false
                },
                -- transparent_mode = true
            })
            vim.cmd("colorscheme gruvbox")
        end
    },

    -- Telescope (Fuzzy Finder)
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>",
                {
                    desc = "Telescope find files"
                }
            )
            vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",
                {
                    desc = "Telescope live grep"
                }
            )
        end
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "vimdoc",
                    "lua",
                    "cpp"
                },
                highlight = { enable = true },
                indent = { enable = true }
            }
        end

    },

    -- Commenter
    {
        "numToStr/Comment.nvim"
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup()
        end
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 0
                }
            })
        end
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup({})
            vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",
                {
                    desc = "Nvim Tree Toggle"
                }
            )
        end
    },

    -- Animations
    {
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup()
        end
    },

    -- Auto closing pairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup{}
        end
    },

    -- Nice, noise, notice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({})
            require("notify").setup({
                background_colour = "#000000",
            })
        end
    },

    -- Neovim Keymap Reminder
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        dependencies = {
            "echasnovski/mini.icons"
        },
        opts = {
            preset = "helix",
            win = {
                title = false
            }
        }
    },

    -- Language Support Protocol
    {
        "neovim/nvim-lspconfig"
    },

    -- Completion plugins
    {
        "hrsh7th/nvim-cmp",          -- completion plugin
        "hrsh7th/cmp-nvim-lsp",      -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer",        -- buffer completions
        "hrsh7th/cmp-path",          -- path completions
        "hrsh7th/cmp-cmdline",       -- cmdline completions
        "L3MON4D3/LuaSnip",          -- snippet engine
        "saadparwaiz1/cmp_luasnip",  -- snippet completions
    }

    -- Transparent background
    -- {
    --     "xiyaowong/transparent.nvim",
    --     config = function()
    --         -- Optional, you don't have to run setup.
    --         require("transparent").setup({
    --             -- table: default groups
    --             groups = {
    --                 'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    --                 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    --                 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    --                 'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    --                 'EndOfBuffer',
    --             },
    --             -- table: additional groups that should be cleared
    --             extra_groups = {},
    --             -- table: groups you don't want to clear
    --             exclude_groups = {},
    --             -- function: code to be executed after highlight groups are cleared
    --             -- Also the user event "TransparentClear" will be triggered
    --             on_clear = function() end,
    --         })
    --         vim.cmd("TransparentEnable")
    --     end
    -- }
}
