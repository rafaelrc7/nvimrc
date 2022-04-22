-- This file is used by configs that don't use packer

local load_nvim_module = require"utils".load_nvim_module;

local module_name = "plugin"
local plugins = { "airline", "lsp", "neorg", "nvim-tree", "presence",
				  "snippets", "telescope", "treesitter", "vimtex" }

local module_path = module_name .. "."
for _, plugin in ipairs(plugins) do
	load_nvim_module(module_path .. plugin)
end

