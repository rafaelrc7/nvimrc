vim.g.OmniSharp_server_use_mono = true;
vim.g.ale_linters_explicit = true;

vim.g.ale_fixers = {
	["*"] = {"remove_trailing_lines", "trim_whitespace"},
	haskell = {"hlint"},
	c = {"clang-format"},
	cpp = {"clang-format"},
	html = {"prettier"},
	css = {"prettier"},
	javascript = {"prettier"},
	elixir = {"mix_format"},
};

-- nvim-lsp
local nvim_lsp = require("lspconfig");
local pid = vim.fn.getpid()
local capabilities = vim.lsp.protocol.make_client_capabilities();

local function on_attach()
end

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"};

-- TS
nvim_lsp.tsserver.setup{ on_attach=on_attach };

-- CLANGD
nvim_lsp.clangd.setup {
	on_attach = on_attach,
	filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp" },
	root_dir = function() return vim.loop.cwd() end
};

-- Rust
nvim_lsp.rust_analyzer.setup{ on_attach=on_attach };

-- Elixir
nvim_lsp.elixirls.setup{
	cmd = { "/usr/lib/elixir-ls/language_server.sh" };
};

-- Haskell (hls)
nvim_lsp.hls.setup{};

-- html
capabilities.textDocument.completion.completionItem.snippetSupport = true;

nvim_lsp.html.setup {
	capabilities = capabilities,
};

-- Java (jdtls)
nvim_lsp.jdtls.setup{};

-- Json
nvim_lsp.jsonls.setup {
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0});
			end
		},
	},
};

-- C# (Omnisharp)
local omnisharp_bin = "/home/rafael/.bin/omnisharp/run"
nvim_lsp.omnisharp.setup{
	cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
	root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln"),
};

-- Python (pyright)
nvim_lsp.pyright.setup{
	settings = {
		python = {
			analysis = {
				extraPaths = {".", "src"},
			},
		},
	},
};

-- Lua (sumneko)
local sumneko_root = "/home/rafael/Dev/src/lua-language-server"
local sumneko_bin = sumneko_root .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')

nvim_lsp.sumneko_lua.setup {
	cmd = {sumneko_bin, "-E", sumneko_root .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
};

-- LaTeX (texlab)
nvim_lsp.texlab.setup{};

-- Vim
nvim_lsp.vimls.setup{};

require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
		border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	};

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = false;
		ultisnips = true;
		luasnip = false;
		neorg = true;
	};
}

