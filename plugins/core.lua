return {
  -- Reconfigure defaults
  { "akinsho/toggleterm.nvim", enabled = false },
  { "mfussenegger/nvim-dap", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  { "mfussenegger/nvim-dap-python", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      table.insert(opts.event_handlers, {
        event = "vim_buffer_enter",
        handler = function()
          if vim.bo.filetype == "neo-tree" then vim.cmd "setlocal rnu" end
        end,
      })
    end,
  },
  {
    "AstroNvim/astrotheme",
    lazy = false,
    priority = 1000,
    opts = {
      plugins = { ["dashboard-nvim"] = true },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = function(_, opts) opts.default_amount = 5 end,
  },
  { "lewis6991/gitsigns.nvim", opts = { numhl = true } },
  {
    "kevinhwang91/nvim-ufo",
    opts = function(_, opts)
      opts.fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" %d"):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      opts.statusline = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astronvim.utils.status module

        -- add the vim mode component
        status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.utils.status module
            color = function() return { main = status.hl.mode_bg(), right = "blank_bg" } end,
          },
        },
        status.component.cmd_info {
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "none",
            -- set the color of the surrounding based on the current mode using astronvim.utils.status module
            color = { left = "blank_bg", main = "blank_bg", right = "blank_bg" },
          },
        },
        -- we want an empty space here so we can use the component builder to make a new section with just an empty string
        status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = { separator = "left", color = { main = "blank_bg", right = "file_info_bg" } },
        },
        -- add a section for the currently opened file information
        status.component.file_info {
          -- enable the file_icon and disable the highlighting based on filetype
          file_icon = { padding = { left = 0 } },
          filename = { fallback = "Empty" },
          -- add padding
          padding = { right = 1 },
          -- define the section separator
          surround = { separator = "left", condition = false },
        },
        -- add a component for the current git branch if it exists and use no separator for the sections
        status.component.git_branch { surround = { separator = "none" } },
        -- add a component for the current git diff if it exists and use no separator for the sections
        status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
        -- fill the rest of the statusline
        -- the elements after this will appear in the middle of the statusline
        status.component.fill(),
        -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
        status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
        -- fill the rest of the statusline
        -- the elements after this will appear on the right of the statusline
        status.component.fill(),
        -- add a component for the current diagnostics if it exists and use the right separator for the section
        status.component.diagnostics { surround = { separator = "right" } },
        -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
        status.component.lsp { lsp_progress = false, surround = { separator = "right" } },
        -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
        -- all of the children of this table will be treated together as a single component
        {
          -- define a simple component where the provider is just a folder icon
          status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = require("astronvim.utils").get_icon "FolderClosed" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          -- add a file information component and only show the current working directory name
          status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
            -- disable all other elements of the file_info component
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = { separator = "none", color = "file_info_bg", condition = false },
          },
        },
        -- the final component of the NvChad statusline is the navigation section
        -- this is very similar to the previous current working directory section with the icon
        { -- make nav section with icon border
          -- define a custom component with just a file icon
          status.component.builder {
            { provider = require("astronvim.utils").get_icon "ScrollText" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the icon foreground
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
          },
          -- add a navigation component and just display the percentage of progress in the file
          status.component.nav {
            -- add some padding for the percentage provider
            percentage = { padding = { right = 1 } },
            -- disable all other providers
            ruler = false,
            scrollbar = false,
            -- use no separator and define the background color
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
      }

      -- return the final options table
      return opts
    end,
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
    opts = function(plugin, opts)
      require "plugins.configs.alpha"(plugin, opts)
      require "alpha.term"

      ASCII_IMAGES_FOLDER = os.getenv "HOME" .. "/.config/nvim/lua/user/static"

      local function list_files(path, extension)
        local files = {}
        local pfile = io.popen("ls " .. path .. "/*" .. extension)

        for filename in pfile:lines() do
          table.insert(files, filename)
        end

        return files
      end

      local function get_random_ascii_image(path)
        math.randomseed(os.clock())

        -- Ascii images have the extension .cat
        local images = list_files(path, ".cat")

        return images[math.random(1, #images)]
      end

      local function get_ascii_image_dim(path)
        local width = 0
        local height = 0

        local pfile = io.open(path, "r")

        for line in pfile:lines() do
          -- Take into account colored output
          local current_width = vim.fn.strdisplaywidth(line)
          if current_width > width then width = current_width end
          height = height + 1
        end

        -- For some reason, after the last update or something,
        -- I have to add 2 to width, otherwise the image is not
        -- displayed correctly
        return { width, height }
      end

      local random_image = get_random_ascii_image(ASCII_IMAGES_FOLDER)
      local image_width, image_height = unpack(get_ascii_image_dim(random_image))

      -- This avoids "process exited message"
      local command = ASCII_IMAGES_FOLDER .. "/animated_lolcat.sh "

      local terminal = {
        type = "terminal",
        command = command .. random_image,
        width = image_width,
        height = image_height + 1,
        opts = {
          redraw = true,
          window_config = {},
        },
      }

      local dashboard = require "alpha.themes.dashboard"
      dashboard.section.terminal = terminal

      local button = require("astronvim.utils").alpha_button
      dashboard.section.buttons.val = {
        button("LDR f o", "  Recents  "),
        button("LDR f p", "  Projects  "),
        button("LDR f f", "󰥨  Find File  "),
        button("LDR f w", "󰺮  Find Word  "),
        button("LDR S l", "  Last Session  "),
      }

      dashboard.config.opts.noautocmd = true
      dashboard.config.layout = {
        { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
        terminal,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }
      return dashboard
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = function(plugin, opts)
      require "plugins.configs.notify"(plugin, opts)
      opts.fps = 60
      opts.timeout = 2000
      return opts
    end,
  },
}
