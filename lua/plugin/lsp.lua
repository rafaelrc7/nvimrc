local utils = require("utils");

-- nvim-lsp
local nvim_lsp = require("lspconfig");
local pid = vim.fn.getpid()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local home_dir = os.getenv("HOME")

local function on_attach()
end

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"};

-- CLANGD
nvim_lsp.clangd.setup {
	on_attach = on_attach,
	filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda" },
	root_dir = function() return vim.loop.cwd() end,
	capabilities = capabilities,
};

-- Rust
nvim_lsp.rust_analyzer.setup{
	on_attach=on_attach,
	capabilities = capabilities,
};

-- Elixir
nvim_lsp.elixirls.setup{
	on_attach = on_attach,
	cmd = { "/usr/lib/elixir-ls/language_server.sh" },
	capabilities = capabilities,
};

-- Haskell (hls)
nvim_lsp.hls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
};

-- html
capabilities.textDocument.completion.completionItem.snippetSupport = true;

nvim_lsp.html.setup {
	cmd = {"vscode-html-languageserver", "--stdio"},
	on_attach = on_attach,
	capabilities = capabilities,
};

-- CSS
nvim_lsp.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- TS
nvim_lsp.tsserver.setup{
	on_attach=on_attach,
	capabilities = capabilities,
};

-- Json
nvim_lsp.jsonls.setup {
	cmd = {"vscode-json-languageserver", "--stdio"},
	on_attach = on_attach,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0});
			end
		},
	},
	capabilities = capabilities,
};

-- C# (Omnisharp)
local omnisharp_bin = home_dir .. "/.local/bin/omnisharp-linux-x64/run"
nvim_lsp.omnisharp.setup{
	on_attach = on_attach,
	cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
	root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln"),
	capabilities = capabilities,
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
	capabilities = capabilities,
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
	capabilities = capabilities,
};

-- LaTeX (texlab)
nvim_lsp.texlab.setup{
	on_attach = on_attach,
	capabilities = capabilities,
};

-- Vim
nvim_lsp.vimls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
};

-- Nix (rnix-lsp)
nvim_lsp.rnix.setup{
	on_attach = on_attach,
	capabilities = capabilities,
};

utils.nvim_create_augroups(
	{
		lspconfig = {
			{"CursorHold", "*", "lua vim.diagnostic.open_float()"},

			-- Java (jdtls)
			{"FileType", "java", "lua require('jdtls').start_or_attach({cmd = {'jdtls.sh'}})"}
		},
	}
);

