local g = vim.g;
local o = vim.opt;

g.airline_powerline_fonts = true;
g.airline_section_b = "%{vimcaps#statusline(1)} %{airline#util#wrap(airline#extensions#branch#get_head(),80)}";

g.tex_flavor = "latex";

g.vimtex_view_general_viewer = "qpdfview";
g.vimtex_view_general_options = [[--unique @pdf\#src:@tex:@line:@col]];
g.vimtex_view_general_options_latexmk = "--unique";

g.UltiSnipsExpandTrigger="<C-j>";
g.UltiSnipsJumpForwardTrigger="<c-b>";
g.UltiSnipsJumpBackwardTrigger="<c-z>";

g.OmniSharp_server_use_mono = true;

g.ale_linters_explicit = true;

g.ale_linters = {
	java = {"javac"},
};

g.ale_fixers = {
	["*"] = {"remove_trailing_lines", "trim_whitespace"},
	haskell = {"hlint"},
	c = {"clang-format"},
	cpp = {"clang-format"},
	html = {"prettier"},
	css = {"prettier"},
	javascript = {"prettier"},
	elixir = {"mix_format"},
};

require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { }, -- List of parsers to ignore installing
	highlight = {
		enable = true,  -- false will disable the whole extension
		disable = { },  -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
}

o.foldmethod = "expr";
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()");
