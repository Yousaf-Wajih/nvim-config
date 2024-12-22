return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fF", LazyVim.pick("auto"), desc = "Find Files (Root Dir)" },
    { "<leader>ff", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>sW", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
    { "<leader>sw", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
    { "<leader>sw", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
    { "<leader>sW", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
  },
}
