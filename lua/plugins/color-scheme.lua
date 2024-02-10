return {
  {
    "arzg/vim-colors-xcode",
    config = function()
      vim.cmd.colorscheme("xcode")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      --vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
