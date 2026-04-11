return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"go",
			"cpp",
            "python",
		},
		auto_install = true,

		highlight = {
			enable = true,
		},

		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		-- Re-trigger filetype detection for buffers opened from
		-- dashboard/telescope where filetype wasn't set yet
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function(args)
				if vim.bo[args.buf].filetype == "" and vim.api.nvim_buf_get_name(args.buf) ~= "" then
					vim.cmd("filetype detect")
				end
			end,
		})
	end,
}
