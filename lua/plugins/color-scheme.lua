return {
  -- {
  --   "sainnhe/sonokai",
  --   priority = 1000,
  --   config = function()
  --     vim.g.sonokai_transparent_background = 1
  --     vim.g.sonokai_enable_italic = 1
  --     vim.g.sonokai_style = "andromeda"
  --     vim.cmd.colorscheme("sonokai")
  --   end,
  -- },
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
