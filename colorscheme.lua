-- Set colorscheme to use
local colorschemes = {
  -- "tokyonight-night",
  "astrodark",
  "fluoromachine",
}

math.randomseed(os.clock())

return colorschemes[math.random(1, #colorschemes)]
