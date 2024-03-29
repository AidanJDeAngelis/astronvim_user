-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local nmap = {
  -- Disable Builtins
  ["<leader>o"] = false,
  ["<leader>c"] = false,
  ["<leader>C"] = false,
  ["<leader>h"] = false,
  ["<leader>n"] = false,
  ["<leader>ft"] = false,
  ["<leader>fm"] = false,
  ["<leader>tn"] = false,
  ["<leader>tp"] = false,
  ["<leader>tt"] = false,
  ["<leader>tu"] = false,
  ["<leader>ub"] = false,
  ["<leader>un"] = false,
  ["<leader>uy"] = false,
  ["<leader>uY"] = false, -- TODO: move to LSP mappings

  -- Remap Builtins
  ["<leader>fo"] = { function() require("telescope.builtin").oldfiles { only_cwd = true } end, desc = "Find history" },
  ["<leader>fH"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" },
  ["<leader>bq"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
  ["<leader>bQ"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" },

  -- AI / Autocomplete
  ["<leader>a"] = { name = "󰚩 AI/Autocomplete" },
  ["<leader>aC"] = { function() require("astronvim.utils.ui").toggle_cmp() end, desc = "Toggle cmp" },

  -- Buffers and Tabs
  ["<leader>bt"] = { name = "󰓩 Tabs" },
  ["<leader>btn"] = { "<cmd>tabnew<CR>", desc = "New tab" },
  ["<leader>btq"] = { "<cmd>tabclose<CR>", desc = "Close tab" },

  -- Windows
  ["<C-w>r"] = { function() require("smart-splits").start_resize_mode() end, desc = "Resize Mode (HJKL)" },
  ["<C-w>p"] = {
    function()
      wp = require "window-picker"
      window_id = wp.pick_window { hint = "floating-big-letter" }
      vim.api.nvim_set_current_win(window_id)
    end,
    desc = "Pick Window",
  },

  -- Files / Search
  ["<leader>fp"] = {
    function() require("telescope").extensions.project.project {} end,
    desc = "Find projects",
  },
  ["<leader>fh"] = { name = "󰓾 Harpoon", desc = "󰓾 Harpoon" },
  ["<leader>fhm"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
  ["<leader>fha"] = { function() require("harpoon.mark").add_file() end, desc = "Add file" },
  ["<leader>fhd"] = { function() require("harpoon.mark").rm_file() end, desc = "Remove file" },

  -- Appearance
  ["<leader>."] = { desc = "which_key_ignore" },
  ["<leader>..."] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "F*** My Life" },
  ["<leader>uh"] = {
    function() require("hlargs").toggle() end,
    desc = "Toggle hlargs",
  },

  -- Movement
  ["<C-d>"] = { "<C-d>zz", desc = "Half page down" },
  ["<C-u>"] = { "<C-u>zz", desc = "Half page up" },
  ["n"] = { "nzzzv", desc = "Next" },
  ["N"] = { "Nzzzv", desc = "Prev" },
  ["J"] = { "mzJ`z", desc = "Join lines" },
  -- Text Manipulation
  ["x"] = { '"_x', desc = "which_key_ignore", noremap = true },
  ["<leader>e"] = { name = " Edit", desc = " Edit" },
  ["<leader>ep"] = { '"+p', desc = "Paste from clipboard" },
  ["<leader>ed"] = { '"+d', desc = "Cut into clipboard" },
  ["<leader>eD"] = { '"_d', desc = "Delete into the void" },
  ["<leader>ey"] = { '"+y', desc = "Yank into clipboard" },

  -- Tests
  ["<leader>T"] = { name = "󰙨 Test" },
  ["<leader>Tq"] = { function() require("neotest").run.stop() end, desc = "Stop test" },
  ["<leader>Tt"] = { function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
  ["<leader>Tr"] = { name = " Run tests" },
  ["<leader>Trr"] = { function() require("neotest").run.run() end, desc = "Run nearest test" },
  ["<leader>TrR"] = { function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run all tests in file" },
  ["<leader>Trl"] = { function() require("neotest").run.run_last() end, desc = "Re-run last test" },
  ["<leader>Td"] = { name = " Debug tests" },
  ["<leader>Tdr"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug nearest test" },
  ["<leader>TdR"] = {
    function() require("neotest").run.run { vim.fn.expand "%", strategy = "dap" } end,
    desc = "Debug all tests in file",
  },
  ["<leader>Tdl"] = {
    function() require("neotest").run.run_last { vim.fn.expand "%", strategy = "dap" } end,
    desc = "Debug last test",
  },
}

local vmap = {
  -- Movement
  ["<C-d>"] = nmap["<C-d>"],
  ["<C-u>"] = nmap["<C-u>"],
  ["<"] = { "<gv", desc = "Indent left" },
  [">"] = { ">gv", desc = "Indent right" },
  ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move block down" },
  ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move block up" },
  -- Text Manipulation
  ["p"] = { '"_dP', desc = "which_key_ignore" },
  ["<leader>e"] = nmap["<leader>e"],
  ["<leader>ep"] = { '"_d"+P', desc = "Paste from clipboard" },
  ["<leader>ed"] = nmap["<leader>ed"],
  ["<leader>eD"] = nmap["<leader>eD"],
  ["<leader>ey"] = nmap["<leader>ey"],
  ["<leader>et"] = nmap["<leader>et"],
  ["<leader>ef"] = nmap["<leader>ef"],
}

return {
  n = nmap,
  v = vmap,
}
