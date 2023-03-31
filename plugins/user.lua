return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  -- File Navigation
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "User AstroFile",
  },
  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/Documents/Scratch",
      completion = {
        nvim_cmp = true,
      },
    },
  },

  -- Code Manipulation and Navigation
  { "mbbill/undotree", event = "User AstroFile" },

  -- Code Completion
  {
    "Exafunction/codeium.vim",
    event = "User AstroFile",
    init = function()
      vim.g.codeium_enabled = 0
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_idle_delay = 500
    end,
    config = function()
      vim.keymap.set("i", "<S-Right>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<S-Up>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<S-Down>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<S-Left>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    end,
  },

  -- Appearance
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "toppair/peek.nvim",
    event = "User AstroFile",
    build = "deno task --quiet build:fast",
    config = function()
      local peek = require "peek"
      peek.setup {}
      local cmd = vim.api.nvim_create_user_command
      cmd("PeekOpen", require("peek").open, {})
      cmd("PeekClose", require("peek").close, {})
    end,
  },
  { "Eandrju/cellular-automaton.nvim", event = "User AstroFile" },
  {
    "folke/twilight.nvim",
    event = "User AstroFile",
    config = function()
      require("twilight").setup {
        dimming = {
          inactive = true,
        },
        expand = {
          "class_definition",
          "function",
          "function_definition",
          "method",
          "table",
          "table_constructor",
          "dictionary",
          "if_statement",
          "for_statement",
          "try_statement",
        },
      }
    end,
  },
}
