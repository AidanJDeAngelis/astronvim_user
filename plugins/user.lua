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
  },
  -- Code Manipulation and Navigation
  {
    "kylechui/nvim-surround",
    event = "User Astrofile",
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
    event = "User Astrofile",
    config = function() require("leap").add_default_mappings() end,
  },
  { "mbbill/undotree", event = "User AstroFile" },
  -- Appearance
  {
    "toppair/peek.nvim",
    event = "User Astrofile",
    build = "deno task --quiet build:fast",
    config = function()
      local peek = require "peek"
      peek.setup {}
      local cmd = vim.api.nvim_create_user_command
      cmd("PeekOpen", require("peek").open, {})
      cmd("PeekClose", require("peek").close, {})
    end,
  },
  { "Eandrju/cellular-automaton.nvim", event = "User Astrofile" },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "folke/twilight.nvim",
    event = "User Astrofile",
    config = function()
      require("twilight").setup {
        dimming = {
          inactive = true,
        },
      }
    end,
  },
}
