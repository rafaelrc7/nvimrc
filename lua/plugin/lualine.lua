require"lualine".setup {
	options = {
		theme = "gruvbox_dark",
	},
	sections = {
		lualine_c = {
			"filename",
			"lsp_progress",
		}
	},
}

