return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
        },
      })
      require("lspconfig").sourcekit.setup({
        cmd = {
          "/Applications/Xcode-15.2.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- HTML
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- Global mappings
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

      -- Diagnostic signs
      local signs = {
        Error = "",
        Warn = "",
        Hint = "",
        Info = "",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {
          text = icon,
          texthl = hl,
          numhl = hl,
        })
      end

      -- 診斷顯示配置
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}

