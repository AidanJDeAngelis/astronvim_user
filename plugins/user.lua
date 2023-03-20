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
  { "mbbill/undotree" },
}
