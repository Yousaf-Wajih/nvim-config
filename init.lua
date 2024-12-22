-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").clangd.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lualine").setup({})

require("dap").adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}
