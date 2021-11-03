local load_nvim_module = require"utils".load_nvim_module;

-- General settings
load_nvim_module("options");

-- Plugins
local packer = load_nvim_module("plugins");
if packer then packer.compile() end;

-- Maps and other keybinds
load_nvim_module("maps");

-- Load plugin configs
-- load_nvim_module("plugin");

-- Autocmds
load_nvim_module("autocmds");

