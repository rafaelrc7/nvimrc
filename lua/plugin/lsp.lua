local utils = require("utils");

-- nvim-lsp
local nvim_lsp = require("lspconfig");
local pid = vim.fn.getpid()
local capabilities = vim.lsp.protocol.make_client_capabilities();

local function on_attach()
end

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"};

-- CLANGD
nvim_lsp.clangd.setup {
	on_attach = on_attach,
	filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda" },
	root_dir = function() return vim.loop.cwd() end
};

-- Rust
nvim_lsp.rust_analyzer.setup{ on_attach=on_attach };

-- Elixir
nvim_lsp.elixirls.setup{
	on_attach = on_attach,
	cmd = { "/usr/lib/elixir-ls/language_server.sh" };
};

-- Haskell (hls)
nvim_lsp.hls.setup{
	on_attach = on_attach,
};

-- html
capabilities.textDocument.completion.completionItem.snippetSupport = true;

nvim_lsp.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
};

-- CSS
nvim_lsp.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- TS
nvim_lsp.tsserver.setup{ on_attach=on_attach };

-- Java (jdtls)
vim.cmd(
[[
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'jdtls.sh'}})
  augroup end
endif
]]);

-- Json
nvim_lsp.jsonls.setup {
	on_attach = on_attach,
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
	on_attach = on_attach,
	cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
	root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln"),
};

-- Python (pyright)
nvim_lsp.pyright.setup{
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				extraPaths = {".", "src"},
			},
		},
	},
};

-- Lua (sumneko)
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
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
nvim_lsp.texlab.setup{
	on_attach = on_attach,
};

-- Vim
nvim_lsp.vimls.setup{
	on_attach = on_attach,
};

-- Nix (rnix-lsp)
nvim_lsp.rnix.setup{
	on_attach = on_attach,
};

require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'disable';
	throttle_time = 80;
	source_timeout = 500;
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

utils.nvim_create_augroups(
	{
		lspconfig = {
			{"CursorHold", "*", "lua vim.diagnostic.open_float()"},
		},
	}
);
