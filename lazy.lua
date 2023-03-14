-- Configure require("lazy").setup() options
return {
  defaults = { lazy = true },
  performance = {
    rtp = {
      -- customize default disabled vim plugins
      disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
    },
  },
  diff = { cmd = "terminal_git" },
  checker = { enabled = true },
}
