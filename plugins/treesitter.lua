return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  opts = {
    -- ensure_installed = { "lua" },
    textobjects = {
      select = {
        enable = true,
        -- automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- you can use the capture groups defined in textobjects.scm
          ["ac"] = { query = "@class.outer", desc = "Around class" },
          ["ic"] = { query = "@class.inner", desc = "Inside class" },
          ["af"] = { query = "@function.outer", desc = "Around function" },
          ["if"] = { query = "@function.inner", desc = "Inside function" },
          ["aP"] = { query = "@parameter.outer", desc = "Around parameter" },
          ["iP"] = { query = "@parameter.inner", desc = "Inside paramter" },
        },
        -- you can choose the select mode (default is charwise 'v')
        --
        -- can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'v', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ["@class.outer"] = "V", -- linewise
          ["@class.inner"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@function.inner"] = "v", -- charwise
          ["@parameter.outer"] = "v", -- charwise
          ["@parameter.inner"] = "v", -- charwise
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>lf>"] = { query = "@function.outer", desc = "Swap next function" },
          ["<leader>lp>"] = { query = "@parameter.inner", desc = "Swap next parameter" },
        },
        swap_previous = {
          ["<leader>lf<"] = { query = "@function.outer", desc = "Swap prev function" },
          ["<leader>lp<"] = { query = "@parameter.inner", desc = "Swap prev parameter" },
        },
      },
    },
  },
}
