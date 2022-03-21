local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- Neorg parser
parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main"
	},
}

require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { }, -- List of parsers to ignore installing
	highlight = {
		enable = true,  -- false will disable the whole extension
		disable = { },  -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
}

vim.o.foldmethod = "expr";
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()");

