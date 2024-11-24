return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "Darren",
            path = "/Users/wuderen/Library/Mobile Documents/iCloud~md~obsidian/Documents/Darren",
          },
          {
            name = "Notion-Export",
            path = "/Users/wuderen/WorkSpace/NotionExport/Notion/Notion-Export",
          },
        },
        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ["gf"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
          -- Toggle check-boxes.
          ["<leader>ch"] = {
            action = function()
              return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
          },
        },
        templates = {
          subdir = "Templates",
          date_format = "%Y-%m-%d",
          time_format = "%H:%M:%S",
          tags = "",
          substitutions = {
            yesterday = function()
              return os.date("%Y-%m-%d", os.time() - 86400)
            end,
            tomorrow = function()
              return os.date("%Y-%m-%d", os.time() + 86400)
            end,
          },
        },
      })
      vim.opt.conceallevel = 2
    end,
  },
}
