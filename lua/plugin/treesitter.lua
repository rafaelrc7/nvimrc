require'nvim-treesitter.configs'.setup {
	ensure_installed = "norg",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { }, -- List of parsers to ignore installing
	highlight = {
		enable = true,  -- false will disable the whole extension
		disable = { },  -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
}

vim.o.foldmethod = "expr";
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()");

