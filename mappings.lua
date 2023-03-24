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
  ["<leader>q"] = false,
  ["<leader>w"] = false,
  ["<leader>ft"] = false,
  ["<leader>fm"] = false,
  ["<leader>tn"] = false,
  ["<leader>tp"] = false,
  ["<leader>tt"] = false,
  ["<leader>tu"] = false,
  ["<leader>ub"] = false,
  ["<leader>un"] = false,

  -- Remap Builtins
  ["<leader>fe"] = { name = "󰙅 Explorer" },
  ["<leader>fet"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  ["<leader>fef"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  },
  ["<leader>fH"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" },
  ["<leader>bq"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
  ["<leader>bQ"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" },
  ["<leader>uc"] = {
    function()
      if vim.g.codeium_enabled then
        vim.cmd "CodeiumDisable"
        vim.g.codium_enabled = false
      else
        vim.cmd "CodeiumEnable"
        vim.g.codium_enabled = true
      end
    end,
    desc = "Toggle Codeium autocomplete",
  },
  ["<leader>uC"] = { require("astronvim.utils.ui").toggle_cmp, desc = "Toggle cmp autocomplete" },
  ["<leader>th"] = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },

  -- Buffers and Tabs
  ["<leader>bt"] = { name = "󰓩 Tabs" },
  ["<leader>btn"] = { "<cmd>tabnew<CR>", desc = "New tab" },
  ["<leader>btq"] = { "<cmd>tabclose<CR>", desc = "Close tab" },

  -- Files
  ["<leader>fp"] = {
    function() require("telescope").extensions.project.project {} end,
    desc = "Find projects",
  },
  ["<leader>fh"] = { name = "󰓾 Harpoon", desc = "󰓾 Harpoon" },
  ["<leader>fhm"] = { function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
  ["<leader>fha"] = { function() require("harpoon.mark").add_file() end, desc = "Add file" },
  ["<leader>fhd"] = { function() require("harpoon.mark").rm_file() end, desc = "Remove file" },

  -- Appearance
  ["<leader>F"] = { name = "which_key_ignore" },
  ["<leader>FM"] = { name = "F*** My" },
  ["<leader>FML"] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "F*** My Life" },
  ["<leader>ut"] = { "<cmd>Twilight<CR>", desc = "Toggle twilight" },

  -- Movement
  ["<C-d>"] = { "<C-d>zz", desc = "Half page down" },
  ["<C-u>"] = { "<C-u>zz", desc = "Half page up" },
  ["n"] = { "nzzzv", desc = "Next" },
  ["N"] = { "Nzzzv", desc = "Prev" },

  -- Text Manipulation
  ["x"] = { '"_x', desc = "which_key_ignore" },
  ["<leader>e"] = { name = " Edit", desc = " Edit" },
  ["<leader>ep"] = { '"+p', desc = "Paste from clipboard" },
  ["<leader>ed"] = { '"+d', desc = "Cut into clipboard" },
  ["<leader>eD"] = { '"_d', desc = "Delete into the void" },
  ["<leader>ey"] = { '"+y', desc = "Yank into clipboard" },
  ["<leader>et"] = { "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  ["<leader>ef"] = { "<cmd>UndotreeFocus<cr>", desc = "Focus Undotree" },

  -- Tests
  ["<leader>T"] = { name = "󰙨 Test" },
  ["<leader>Tr"] = { function() require("neotest").run.run() end, desc = "Run nearest test" },
  ["<leader>TR"] = { function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run tests in file" },
  ["<leader>Td"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug nearest test" },
  ["<leader>Tq"] = { function() require("neotest").run.stop() end, desc = "Stop test" },
}

local vmap = {
  -- Movement
  ["<C-d>"] = nmap["<C-d>"],
  ["<C-u>"] = nmap["<C-u>"],
  -- Text Manipulation
  ["<leader>e"] = nmap["<leader>e"],
  ["<leader>ep"] = nmap["<leader>ep"],
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
