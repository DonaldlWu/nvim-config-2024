return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float",
				open_mapping = [[<c-\>]],
			})
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
			local htop = Terminal:new({ cmd = "htop", hidden = true })

			function _LAZYGIT_TOGGLE()
				lazygit:toggle()
			end

			function _HTOP_TOGGLE()
				htop:toggle()
			end

			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
			vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>")

			vim.keymap.set("n", "<leader>tl", "<cmd>lua _LAZYGIT_TOGGLE()<cr>")
			vim.keymap.set("n", "<leader>ht", "<cmd>lua _HTOP_TOGGLE()<cr>")
		end,
	},
}
