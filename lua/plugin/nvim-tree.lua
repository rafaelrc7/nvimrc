local g = vim.g;

g.nvim_tree_quit_on_open = 1;
g.nvim_tree_highlight_opened_files = 1;

require "nvim-tree".setup {
	disable_netrw = true,
	hijack_netrw = true;
	auto_close = true,
	open_on_tab = true,
	filters = {
		custom = {".git", "node_modules", ".cache"},
	},
};

