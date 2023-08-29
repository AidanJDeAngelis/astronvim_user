-- If you need more control, you can use the function()...end notation
return function(local_vim)
  -- Options --
  local_vim.opt.relativenumber = true -- sets vim.opt.relativenumber
  local_vim.opt.number = true -- sets vim.opt.number
  local_vim.opt.spell = false -- sets vim.opt.spell
  local_vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
  local_vim.opt.wrap = false -- sets vim.opt.wrap
  local_vim.opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undo"
  local_vim.opt.undofile = true
  local_vim.opt.swapfile = false
  local_vim.opt.clipboard = ""
  local_vim.opt.guifont = "Hack Nerd Font:h16"
  local_vim.opt.scrolloff = 15
  local_vim.opt.sidescrolloff = 10

  -- Globals --
  local_vim.g.mapleader = " " -- sets vim.g.mapleader
  local_vim.g.autoformat_enabled = true -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
  local_vim.g.cmp_enabled = true -- enable completion at start
  local_vim.g.autopairs_enabled = true -- enable autopairs at start
  local_vim.g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
  local_vim.g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
  local_vim.g.ui_notifications_enabled = true -- disable notifications when toggling UI elements
  local_vim.g.resession_enabled = true -- experimental resession support

  -- Neovide Configuration
  if vim.g.neovide then
    local_vim.g.neovide_transparency = 0.95
    local_vim.g.transparency = 0.95
    local_vim.g.neovide_floating_blur_amount_x = 5
    local_vim.g.neovide_floating_blur_amount_y = 5
    local_vim.g.neovide_remember_window_size = true
    local_vim.g.neovide_cursor_vfx_mode = "railgun"
  end

  return local_vim
end
