-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
local resession_autocmds = function()
  local resession = require "resession"
  local function get_session_name()
    local name = vim.fn.getcwd()
    local branch = vim.trim(vim.fn.system "git branch --show-current")
    if vim.v.shell_error == 0 then
      return name .. branch
    else
      return name
    end
  end
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- If args are passed to nvim then skip prompt
      if vim.fn.argc(-1) ~= 0 then return end
      -- Else, prompt
      local resume_session = "Resume Previous Session"
      local new_session = "New Session"
      local quit = "Quit"

      vim.ui.select({ resume_session, new_session, quit }, {
        prompt = "What It Do?",
        telescope = require("telescope.themes").get_dropdown(),
      }, function(selected)
        if selected == resume_session then
          resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
        elseif selected == "New Session" then
          require("telescope.builtin").builtin { include_extensions = true }
        elseif selected == quit then
          -- Load last session before quitting to prevent it from being lost
          resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
          vim.cmd "qa!"
        end
      end)
    end,
  })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function() resession.save(get_session_name(), { dir = "dirsession", notify = false }) end,
  })
end

local override_colors = function()
  vim.cmd "hi LineNr guibg=none guifg=#ffffff"
  vim.cmd "hi WinSeparator guibg=none guifg=#ffffff"
end

return function()
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
  resession_autocmds()
  override_colors()
end
