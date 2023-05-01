return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- Terminal Integration
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  -- Languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  -- Motion
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  -- Text Manipulation
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.lsp.inc-rename" },
  -- Code Awareness
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- Test Running
  { import = "astrocommunity.test.neotest" },
  -- Appearance
  { import = "astrocommunity.colorscheme.tokyonight" },
  { import = "astrocommunity.colorscheme.nightfox" },
  {
    "EdenEast/nightfox.nvim",
    opts = function(_, opts)
      opts.options.styles = {
        comments = "italic",
        conditionals = "bold",
        keywords = "bold",
        types = "bold,italic",
      }
      opts.options.module_default = true
      return opts
    end,
  },
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    cond = not vim.g.neovide,
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
        -- command_palette = true, -- position the cmdline and popupmenu together
        lsp_doc_border = true, -- add a border to hover docs and signature help
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
      }
      opts.views = {
        cmdline_popup = {
          position = {
            row = -3,
            col = "50%",
          },
          size = {
            min_width = 60,
            width = "auto",
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = -6,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
          },
        },
      }
    end,
  },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "smartcolumn.nvim",
    opts = {
      colorcolumn = { "100" },
      scope = "line",
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
  {
    "levouh/tint.nvim",
    opts = {
      window_ignore_function = function(winid)
        local bufid = vim.api.nvim_win_get_buf(winid)
        local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
        local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

        -- Do not tint `terminal` or floating windows, tint everything else
        return buftype == "terminal" or floating or buftype == "nowrite"
      end,
    },
  },
  { import = "astrocommunity.color.modes-nvim" },
  {
    "modes.nvim",
    config = function(_, opts)
      local status = require "astronvim.utils.status"
      local C = status.env.fallback_colors
      local get_hlgroup = require("astronvim.utils").get_hlgroup

      local HeirlineInsert = get_hlgroup("HeirlineInsert", { bg = nil }).bg or status.hl.lualine_mode("insert", C.green)
      local HeirlineVisual = get_hlgroup("HeirlineVisual", { bg = nil }).bg
        or status.hl.lualine_mode("visual", C.purple)

      opts.colors = {
        insert = HeirlineInsert,
        visual = HeirlineVisual,
      }
      opts.line_opacity = 0.25
    end,
  },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
}
