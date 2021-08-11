local utils = require("utils");

local autocmds = {
	nerdtree = {
		{"StdinReadPre", "*", "let s:std_in=1"},
		{"VimEnter", "*", [[if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif]]},
		{"bufenter", "*", [[if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]]},
	},

	trim_white_space = {
		{"BufWritePre", "*", [[:%s/\s\+$//e]]}
	}
}

utils.nvim_create_augroups(autocmds);

