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
  -- Completion
  {
    "Exafunction/codeium.vim",
    event = "User AstroFile",
    config = function()
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<S-Right>", function() return vim.fn["codeium#Accept"]() end, { expr = true })

      vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<S-Down>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })

      vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<S-Up>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })

      vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("i", "<S-Left>", function() return vim.fn["codeium#Clear"]() end, { expr = true })

      vim.keymap.set("n", "<leader>;", function()
        if vim.g.codeium_enabled == true then
          vim.cmd "CodeiumDisable"
        else
          vim.cmd "CodeiumEnable"
        end
      end, { noremap = true, desc = "Toggle Codeium active" })
    end,
  },

  -- Git
  {
    "ThePrimeagen/git-worktree.nvim",
    lazy = false,
  },
  -- File Navigation
  {
    url = "angaidan@git.amazon.com:pkg/NinjaHooks",
    cond = os.getenv "USER" == "angaidan",
    branch = "mainline",
    lazy = false,
    config = function(plugin)
      vim.opt.rtp:prepend(plugin.dir .. "/configuration/vim/amazon/brazil-config")
      -- Make my own filetype thing to override neovim applying ".conf" file type.
      -- You may or may not need this depending on your setup.
      vim.filetype.add {
        filename = {
          ["Config"] = function()
            vim.b.brazil_package_Config = 1
            return "brazil-config"
          end,
        },
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "User AstroFile",
  },

  -- Code Manipulation and Navigation
  { "mbbill/undotree", event = "User AstroFile" },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "User AstroFile",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
  },

  -- Appearance
  { "nyoom-engineering/oxocarbon.nvim", lazy = false },
  { "Eandrju/cellular-automaton.nvim", event = "User AstroFile" },
}
