return {
  "nvimdev/dashboard-nvim",
  opts = function()
    local logo = [[
██████████╗  █████████╗    ██╗  ███████████╗    ██╗     ██████╗ 
╚══██╔══██║  ████╔════╝    ██║  ████╔════██║    ██║    ██╔═══██╗
   ██║  ████████████╗      ████████████╗ ██║    ██║    ██║   ██║
   ██║  ██╔══████╔══╝      ██╔══████╔══╝ ██║    ██║    ██║   ██║
   ██║  ██║  █████████╗    ██║  ███████████████████████╚██████╔╝
   ╚═╝  ╚═╝  ╚═╚══════╝    ╚═╝  ╚═╚══════╚══════╚══════╝╚═════╝ 
                                                                   
██╗    ██╗██████╗██████╗██╗    ██████╗      ██████╗██╗   ████╗   ██╗
██║    ████╔═══████╔══████║    ██╔══██╗    ██╔════╝██║   ██╚██╗ ██╔╝
██║ █╗ ████║   ████████╔██║    ██║  ██║    ██║  █████║   ██║╚████╔╝ 
██║███╗████║   ████╔══████║    ██║  ██║    ██║   ████║   ██║ ╚██╔╝  
╚███╔███╔╚██████╔██║  ███████████████╔╝    ╚██████╔╚██████╔╝  ██║   
 ╚══╝╚══╝ ╚═════╝╚═╝  ╚═╚══════╚═════╝      ╚═════╝ ╚═════╝   ╚═╝   
[youtube.com/@thehelloworldguyofficial]
     ]]

    logo = string.rep("\n", 2) .. logo .. string.rep("\n", 2)

    local opts = {
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
