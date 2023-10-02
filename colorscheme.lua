-- Set colorscheme to use
local colorschemes = {
  "tokyonight-night",
  "onedark_dark",
  "oxocarbon",
}

math.randomseed(os.clock())

return colorschemes[math.random(1, #colorschemes)]
