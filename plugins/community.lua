return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Code Awareness
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- Appearance
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function(_, opts)
      opts.messages = {
        view_search = false,
      }
      opts.routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      }
      opts.presets = {
        command_palette = true, -- position the cmdline and popupmenu together
        lsp_doc_border = true, -- add a border to hover docs and signature help
      }
    end,
  },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "smartcolumn.nvim",
    opts = {
      colorcolumn = { "80", "100" },
      disabled_filetypes = {
        "help",
        "text",
        "markdown",
        "mason",
        "startify",
        "aerial",
        "alpha",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "neo-tree",
        "Trouble",
      },
    },
  },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.color.modes-nvim" },
}
