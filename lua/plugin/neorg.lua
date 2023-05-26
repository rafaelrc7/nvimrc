require('neorg').setup {
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.concealer"] = {}, -- Allows for use of icons
		["core.completion"] = {
			config  = {
				engine = "nvim-cmp",
			}
		},
		["core.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					my_workspace = "~/neorg"
				}
			}
		}
	},
}

