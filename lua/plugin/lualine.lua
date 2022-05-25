require"lualine".setup {
	options = {
		theme = "nord",
	},
	sections = {
		lualine_c = {
			"filename",
			"lsp_progress",
		}
	},
}

