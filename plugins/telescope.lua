return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-project.nvim",
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = {
          "kkharji/sqlite.lua",
        },
      },
    },
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "project"
      telescope.load_extension "frecency"

      opts.extensions = {
        frecency = {
          default_workspace = "CWD",
          ignore_patterns = {
            "*.git/*",
            "*/tmp/*",
            "*/.venv/*",
            "*/.mypy_cache/*",
            "*/cdk.out/*",
            "*/.idea/*",
            "*/.ropeproject/*",
            "*/activate/*",
          },
        },
      }
    end,
  },
}
