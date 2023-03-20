-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local nmap = {
  -- Disable Builtins
  ["<leader>o"] = false,
  ["<leader>e"] = false,
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
  ["<leader>uC"] = false,
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

  -- Files
  ["<leader>fp"] = {
    function() require("telescope").extensions.project.project {} end,
    desc = "Find projects",
  },
  ["<leader>fh"] = { name = "󰓾 Harpoon" },
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
  ["<C-p>"] = { '"+p', desc = "Paste from clipboard" },
  ["<C-x>"] = { '"+d', desc = "Cut into clipboard" },
  ["<C-y>"] = { '"+y', desc = "Yank into clipboard" },
  ["<leader>U"] = { name = " UndoTree" },
  ["<leader>Ut"] = { "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  ["<leader>Uf"] = { "<cmd>UndotreeFocus<cr>", desc = "Focus Undotree" },
}

return {
  n = nmap,
}
