return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-project.nvim",
      },
    },
    opts = function(_, opts)
      opts.defaults.layout_config.horizontal.preview_width = 0.65

      opts.defaults.preview = opts.defaults.preview or {}
      opts.defaults.preview.filesize_limit = 50
      opts.defaults.preview.timeout = 500
      return opts
    end,
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      local telescope = require "telescope"
      telescope.load_extension "project"
    end,
  },
}
