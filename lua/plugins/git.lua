return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- 設置 highlights
      local function setup_highlights()
        vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "DiffAdd" })
        vim.api.nvim_set_hl(0, "GitSignsChange", { link = "DiffChange" })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "DiffDelete" })

        vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAdd" })
        vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChange" })
        vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDelete" })

        vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAdd" })
        vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChange" })
        vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDelete" })
      end

      -- 初始設置 highlights
      setup_highlights()

      -- 當顏色主題改變時重新設置 highlights
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = setup_highlights,
      })

      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end)
          map("n", "<leader>td", gs.toggle_deleted)
          map("n", "<leader>gp", gs.preview_hunk)
          map("n", "<leader>gt", gs.toggle_current_line_blame)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },
}

