local function load_nvim_module(module)
	module = "plugin." .. module;
	local ok, ret = pcall(require, module);

	if not ok then
		print(string.format("ERROR: Failed to load the %s plugin config.  %s\n", module, ret));
		return nil;
	else
		return ret;
	end
end

load_nvim_module("airline");
load_nvim_module("lsp");
load_nvim_module("snippets");
load_nvim_module("telescope");
load_nvim_module("vimtex");
load_nvim_module("treesitter");
load_nvim_module("neorg");
load_nvim_module("nvim-tree");

