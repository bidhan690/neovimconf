local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = overrides.copilot,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "deno",
        "css-lsp",
        "json-lsp",
        "python-lsp-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "prisma-language-server",
        "gopls",
        "golines",
        "goimports",
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "astro" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "dockerfile",
        "prisma",
        "xml",
        "python",
        "svelte",

        -- low level
        "c",
        "zig",
      },
    },
  },
}

return plugins
