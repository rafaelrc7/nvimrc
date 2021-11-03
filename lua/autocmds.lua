local utils = require("utils");

local autocmds = {
	trim_white_space = {
		{"BufWritePre", "*", [[:%s/\s\+$//e]]}
	},

	haskell_spaces = {
		{"FileType", "haskell", [[:setlocal shiftwidth=4 softtabstop=4 tabstop=8 expandtab]]}
	}
}

utils.nvim_create_augroups(autocmds);

