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
  ["<leader>uy"] = false,
  ["<leader>uY"] = false, -- TODO: move to LSP mappings

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
  ["<leader>FML"] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "F*** My Life" },
  ["<leader>ut"] = {
    function() require("tint").toggle() end,
    desc = "Toggle tint",
  },
  ["<leader>uT"] = {
    function()
      vim.cmd "Twilight"
      require("hlargs").toggle()
    end,
    desc = "Toggle Twilight",
  },
  ["<leader>uh"] = {
    function() require("hlargs").toggle() end,
    desc = "Toggle hlargs",
  },
  ["<leader>uz"] = {
    "<cmd>ZenMode<CR>",
    desc = "Toggle zen mode",
  },

  -- Movement
  ["<C-d>"] = { "<C-d>zz", desc = "Half page down" },
  ["<C-u>"] = { "<C-u>zz", desc = "Half page up" },
  ["n"] = { "nzzzv", desc = "Next" },
  ["N"] = { "Nzzzv", desc = "Prev" },

  -- Text Manipulation
  ["x"] = { '"_x', desc = "which_key_ignore", noremap = true },
  ["<leader>e"] = { name = " Edit", desc = " Edit" },
  ["<leader>ep"] = { '"+p', desc = "Paste from clipboard" },
  ["<leader>ed"] = { '"+d', desc = "Cut into clipboard" },
  ["<leader>eD"] = { '"_d', desc = "Delete into the void" },
  ["<leader>ey"] = { '"+y', desc = "Yank into clipboard" },
  ["<leader>et"] = { "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  ["<leader>ef"] = { "<cmd>UndotreeFocus<cr>", desc = "Focus Undotree" },

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
