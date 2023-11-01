local os_name = vim.loop.os_uname().sysname
local fzf_native_make_comand = 'make'

if os_name == "Windows" or os_name == "Windows_NT" then
    fzf_native_make_comand =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
end

return {
    --
    -- UI
    --
    -- Color Theme
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme dracula")
        end
    },
    -- -- --

    -- Status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'dracula-nvim',
                    icons_enabled = true,
                    section_separators = '',
                    component_separators = '⸽',
                },
            })
        end,
    },
    -- -- --

    -- Colorizer
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    -- -- --

    -- Relative number switcher
    "sitiom/nvim-numbertoggle",
    -- -- --

    -- Indent highlight
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append "space:•"

            local highlight = {
                "CursorColumn",
                "Whitespace",
            }
            require("ibl").setup {
                indent = { highlight = highlight, char = "" },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false,
                },
                scope = { enabled = false },
            }
        end,
    },
    -- -- --
    --
    --
    --

    --
    -- Utils
    --
    -- Nvim tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- -- --

    -- VIM be Good
    "ThePrimeagen/vim-be-good",
    -- -- --

    -- Buff only
    "vim-scripts/BufOnly.vim",
    -- -- --

    -- Case change
    "ggandor/leap.nvim",
    -- -- --

    -- Case change
    "tpope/vim-abolish",
    -- -- --

    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    -- -- --
    --
    --
    --

    --
    -- Coding
    --
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    'folke/neodev.nvim',
    -- -- --

    -- Groovy
    "vim-scripts/groovy.vim",
    -- -- --

    -- code completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
    },
    -- -- --

    -- Git integration
    "lewis6991/gitsigns.nvim",
    -- -- --

    -- tree sitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    -- -- --

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = fzf_native_make_comand,
    },
    -- -- --
    --
    --
    --
}
