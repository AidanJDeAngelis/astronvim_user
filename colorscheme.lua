-- Set colorscheme to use
local colorschemes = {
  "tokyonight-night",
  "fluoromachine",
}

math.randomseed(os.clock())

return colorschemes[math.random(1, #colorschemes)]
