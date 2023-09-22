return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = function(_, opts)
    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Enter>",
        node_incremental = "<Enter>",
        node_decremental = "<BS>",
      },
    }
    opts.textobjects.select.keymaps["i="] = { query = "@assignment.rhs", desc = "inside assignment" }
    opts.textobjects.select.keymaps["a="] = { query = "@assignment.outer", desc = "around assignment" }

    opts.textobjects.move.goto_next_start["]="] = { query = "@assignment.outer", desc = "Next assignment start" }
    opts.textobjects.move.goto_previous_start["[="] =
      { query = "@assignment.outer", desc = "Previous assignment start" }

    return opts
  end,
}
