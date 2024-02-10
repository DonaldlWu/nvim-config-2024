# Read me

Setup nvim by lazyvim

1. Create init.lua and setup for lazy

```
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup(plugins, opts)
```

2. Add catppuccin to plugin for colorscheme, nvim-telescope and nvim-treesitter

```
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
```
3. Setup catppuccin, telescope and treesitter

```
-- Color Scheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- Tree-sitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "typescript"},
  highlight = { enable = true },
  indent = { enable = true },
})
```

4. setup neo-tree

```
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }
```

```
-- Neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
```

5. Separate plugin setting to different file

Move local block to new file `lua/plugins.lua`

```
return {
  { "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }
}
```

And update `init.lua`

```
require("lazy").setup("plugins")
```

6. Setup also move to separate file

Lazy auto merge the return setup, so we can move it to individual file like `lua/plugins/catppuccin.lua'

```
return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}
```

And now we can move all plugin into separate file

7. lua line

# LSP config

1. install mason
2. install mason-lspconfig
3. nvim-lspconfig

## code action

Install telescope-ui-sleect.nvim

## Linter

Install none-ls 

