local g = vim.g;
local utils = require "utils";

g.nvim_tree_highlight_opened_files = 1;

utils.nvim_create_augroups(
	{
		nvim_tree = {
			-- autoclose
			{"BufEnter", "*", "++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"},

		},
	}
);

require "nvim-tree".setup {
	disable_netrw = true,
	hijack_netrw = true;
	open_on_tab = true,
	filters = {
		custom = {".git", "node_modules", ".cache"},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
};

