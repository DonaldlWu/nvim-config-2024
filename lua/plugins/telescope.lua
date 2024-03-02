return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
					},
					live_grep = {
						theme = "ivy",
					},
					lsp_references = {
						theme = "ivy",
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>rf", builtin.lsp_references, {})

			-- extensions
			-- aerial
			vim.keymap.set("n", "<leader>6", function()
				require("telescope").extensions.aerial.aerial()
			end, { noremap = true, silent = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
