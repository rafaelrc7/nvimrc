local utils = require("utils");

local autocmds = {
	trim_white_space = {
		{"BufWritePre", "*", [[:%s/\s\+$//e]]}
	},

	haskell_indent = {
		{"FileType", "haskell", [[:setlocal shiftwidth=4 softtabstop=4 tabstop=8 expandtab]]}
	},

	nix_indent = {
		{"FileType", "nix", [[:setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]}
	},

	elixir_indent = {
		{"FileType", "elixir", [[:setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]}
	},
}

utils.nvim_create_augroups(autocmds);

