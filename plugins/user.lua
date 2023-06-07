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
    end,
    config = function()
      vim.keymap.set("i", "<S-Right>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<S-Up>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<S-Down>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<S-Left>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("n", "<leader>ac", function()
        if vim.g.codeium_enabled == true then
          vim.cmd "CodeiumDisable"
        else
          vim.cmd "CodeiumEnable"
        end
      end, { noremap = true, desc = "Toggle Codeium active" })
    end,
  },

  -- LSP extensions
  {
    "linux-cultist/venv-selector.nvim",
    opts = {},
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },

  -- Appearance
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = (function()
        local colorshemes = { "fluoromachine", "retrowave", "delta" }
        math.randomseed(os.clock())

        return colorshemes[math.random(1, #colorshemes)]
      end)(),
      overrides = function(c)
        return {
          HeirlineInactive = { fg = c.bg, bg = c.bg },
          HeirlineNormal = { fg = c.cyan, bg = c.cyan },
          HeirlineInsert = { fg = c.green, bg = c.green },
          HeirlineVisual = { fg = c.purple, bg = c.purple },
          HeirlineReplace = { fg = c.red, bg = c.red },
          HeirlineCommand = { fg = c.yellow, bg = c.yellow },
          HeirlineTerminal = { fg = c.green, bg = c.green },
        }
      end,
    },
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
