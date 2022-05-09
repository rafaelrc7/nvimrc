local utils = require("utils");
local api = vim.api

local autocmds = {
	trim_white_space = {
		{"BufWritePre", "*", [[:%s/\s\+$//e]]}
	},

	haskell_indent = {
		{"FileType", "haskell,cabal", [[:setlocal shiftwidth=2 softtabstop=2 tabstop=8 expandtab]]}
	},

	nix_indent = {
		{"FileType", "nix", [[:setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]}
	},

	elixir_indent = {
		{"FileType", "elixir", [[:setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]]}
	},
}

utils.nvim_create_augroups(autocmds);

local goGroup = api.nvim_create_augroup("go", { clear = true })
api.nvim_create_autocmd("Filetype", {
	pattern = "go",
	command = "autocmd BufWritePost * !gofmt -w %",
	group = goGroup
})

