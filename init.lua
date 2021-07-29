-- Could be moved to utils.lua, but I though about making init.lua as independent as possible.
local function load_nvim_module(module)
	local ok, ret = pcall(require, module);

	if not ok then
		print(string.format("ERROR: Failed to load the %s module.  %s\n", module, ret));
		return nil;
	else
		return ret;
	end
end

-- General settings
load_nvim_module("options");

-- Plugins
local packer = load_nvim_module("plugins");
if packer then packer.compile() end;

-- Maps and other keybinds
load_nvim_module("maps");

-- Global variables, most related to plugins
load_nvim_module("globals");

-- Autocmds
load_nvim_module("autocmds");

