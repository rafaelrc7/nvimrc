local utils = require("utils");

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"};

utils.nvim_create_augroups(
	{
		lspconfig = {
			{"CursorHold", "*", "lua vim.diagnostic.open_float()"},
		},
	}
);

