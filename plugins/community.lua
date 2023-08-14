return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- Completion
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.codeium-vim" },
  -- Terminal Integration
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
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
  { import = "astrocommunity.debugging.nvim-bqf" },
  -- Text Manipulation
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  {
    "yanky.nvim",
    opts = function(_, opts) opts.ring.history_length = 10 end,
  },
  -- Diagnostics
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  -- Code Awareness
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- Appearance
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
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
