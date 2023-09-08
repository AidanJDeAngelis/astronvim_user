return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- Git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.diffview-nvim" },

  -- Languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  {
    "venv-selector.nvim",
    opts = function(_, opts) opts.name = { "venv", ".venv" } end,
  },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- Motion
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  {
    "nvim-spider",
    opts = function(_, opts)
      vim.opt.iskeyword:append "-"
      return opts
    end,
  },
  { import = "astrocommunity.debugging.nvim-bqf" },
  -- Text Manipulation
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  {
    "yanky.nvim",
    opts = function(_, opts) opts.ring.history_length = 10 end,
  },
  -- Diagnostics
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- Code Awareness
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- Appearance
  { import = "astrocommunity.split-and-window.edgy-nvim" },
  {
    "edgy.nvim",
    opts = function(_, opts)
      opts.animate = { enabled = false }
      table.insert(opts.right, {
        title = "Undotree",
        ft = "undotree",
        size = { height = 0.5 },
      })
      table.insert(opts.right, 1, { ft = "spectre_panel", size = { width = 0.25, height = 0.5 } })
      table.insert(opts.bottom, {
        title = "Undotree Diff",
        ft = "diff",
        size = { height = 20 },
      })
      opts.left = {
        {
          title = "Files",
          ft = "neo-tree",
          filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
          pinned = true,
          open = "Neotree position=left filesystem",
          size = { height = 0.5 },
        },
        {
          title = "Git Status",
          ft = "neo-tree",
          filter = function(buf) return vim.b[buf].neo_tree_source == "git_status" end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        "neo-tree",
      }
    end,
  },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  {
    "onedarkpro.nvim",
    opts = function(_, opts)
      opts.options.highlight_inactive_windows = false
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
    cond = true,
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
}
