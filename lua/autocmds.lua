local utils = require("utils");

local autocmds = {
	trim_white_space = {
		{"BufWritePre", "*", [[:%s/\s\+$//e]]}
	}
}

utils.nvim_create_augroups(autocmds);

