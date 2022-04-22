local load_nvim_module = require"utils".load_nvim_module;

local plugins = { "airline", "lsp", "neorg", "nvim-tree", "presence",
				  "snippets", "telescope", "treesitter", "vimtex" }

for _, plugin in ipairs(plugins) do
	load_nvim_module(plugin)
end

