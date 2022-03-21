return require("packer").startup(function(use)
	-- Packer manages itself
	use {"wbthomason/packer.nvim"};

	-- Lua apis
	use {"svermeulen/vimpeccable"};
	use {"nvim-lua/popup.nvim"};
	use {"nvim-lua/plenary.nvim"};

	use {
		"vim-airline/vim-airline",
		config = function() require "plugin.airline" end,
	};
	use {"edkolev/tmuxline.vim", opt = true};

	-- Syntax and language specific stuff
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function() require "plugin.treesitter" end,
	}
	use {"bfredl/nvim-luadev", ft = {"lua"}};
	use {
		"lervag/vimtex",
		ft = {"tex"},
		config = function() require "plugin.vimtex" end,
	};
	use {
		"iamcco/markdown-preview.nvim",
		opt = true,
		ft = {"markdown"},
		run = "cd app && yarn install"
	};

	-- LSP and linting
	use {
		"neovim/nvim-lspconfig",
		config = function() require "plugin.lsp" end,
	};
	use {"hrsh7th/nvim-compe"};
	use {"simrat39/symbols-outline.nvim"};
	use {"mfussenegger/nvim-jdtls"};
	use {
		"sbdchd/neoformat",
		cmd = "Neoformat",
	};

	-- Snippets
	use {
		"SirVer/ultisnips",
		config = function() require "plugin.snippets" end,
	};
	use {"honza/vim-snippets"};
	use {"mattn/emmet-vim", ft = {"html", "css", "js", "ts"}};

	-- File tree
	use {
		"kyazdani42/nvim-tree.lua",
		config = function () require "plugin.nvim-tree" end,
	};
	use {
		"kyazdani42/nvim-web-devicons",
	};

	-- Misc
	use {"gpanders/editorconfig.nvim"};
	use {"puremourning/vimspector"};
	use {"mbbill/undotree"};
	use {"preservim/nerdcommenter"};
	use {"Raimondi/delimitMate"};
	use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}};
	use {"vim-utils/vim-man"};
	use {"preservim/tagbar"};
	use {"lyuts/vim-rtags"};
	use {
		"nvim-telescope/telescope.nvim",
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function() require "plugin.telescope" end
	};
	use {"nvim-telescope/telescope-fzy-native.nvim"};

	-- git
	use {"tpope/vim-fugitive"};
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	};

	-- Themes
	use {"gruvbox-community/gruvbox", as = "gruvbox"};

	-- neorg
	use {
		"nvim-neorg/neorg",
		requires = "nvim-lua/plenary.nvim",
		config = function() require "plugin.neorg" end,
		after = "nvim-treesitter",
	};

	-- Discord presence
	use {
		"andweeb/presence.nvim",
		config = function() require "plugin.presence" end,
	};
end);

