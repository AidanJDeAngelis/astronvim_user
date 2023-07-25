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
    event = "User AstroFile",
  },
  {
    "epwalsh/obsidian.nvim",
    -- the obsidian vault in this default config  ~/obsidian-vault
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    event = { "bufreadpre " .. vim.fn.expand "~" .. "/Documents/Scratch/**.md" },
    keys = {
      {
        "gf",
        function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
          else
            return "gf"
          end
        end,
        noremap = false,
        expr = true,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      dir = vim.env.HOME .. "/Documents/Scratch", -- specify the vault location. no need to call 'vim.fn.expand' here
      use_advanced_uri = true,
      finder = "telescope.nvim",

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      follow_url_func = vim.ui.open or require("astronvim.utils").system_open,
    },
  },

  -- Code Manipulation and Navigation
  { "mbbill/undotree", event = "User AstroFile" },

  -- Appearance
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = (function()
        local colorshemes = { "fluoromachine", "retrowave", "delta" }
        math.randomseed(os.clock())

        return colorshemes[math.random(1, #colorshemes)]
      end)(),
      overrides = function(c)
        return {
          HeirlineInactive = { fg = c.bg, bg = c.bg },
          HeirlineNormal = { fg = c.cyan, bg = c.cyan },
          HeirlineInsert = { fg = c.green, bg = c.green },
          HeirlineVisual = { fg = c.purple, bg = c.purple },
          HeirlineReplace = { fg = c.red, bg = c.red },
          HeirlineCommand = { fg = c.yellow, bg = c.yellow },
          HeirlineTerminal = { fg = c.green, bg = c.green },
        }
      end,
    },
  },
  { "Eandrju/cellular-automaton.nvim", event = "User AstroFile" },
  {
    "folke/twilight.nvim",
    event = "User AstroFile",
    config = function()
      require("twilight").setup {
        dimming = {
          inactive = true,
        },
        expand = {
          "class_definition",
          "function",
          "function_definition",
          "method",
          "table",
          "table_constructor",
          "dictionary",
          "if_statement",
          "for_statement",
          "try_statement",
        },
      }
    end,
  },
}
