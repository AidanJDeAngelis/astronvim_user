-- Set colorscheme to use
local colorschemes = {
  "tokyonight-night",
  "fluoromachine",
  "oh-my-monokai",
  "onedark_dark",
}

math.randomseed(os.clock())

return colorschemes[math.random(1, #colorschemes)]
