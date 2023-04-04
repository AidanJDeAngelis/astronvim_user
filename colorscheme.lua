-- Set colorscheme to use
local colorschemes = {
  "tokyonight-night",
  "carbonfox",
}

math.randomseed(os.clock())

return colorschemes[math.random(1, #colorschemes)]
