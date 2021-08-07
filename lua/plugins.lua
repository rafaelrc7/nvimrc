return require("packer").startup(function(use)
	-- Packer manages itself
	use {"wbthomason/packer.nvim"};

	-- Lua apis
	use {"svermeulen/vimpeccable"};
	use {"nvim-lua/popup.nvim"};
	use {"nvim-lua/plenary.nvim"};

	use {"vim-airline/vim-airline"};
	use {"edkolev/tmuxline.vim", opt = true};
	use {"suxpert/vimcaps"};

	-- Syntax and language specific stuff
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- use {"sheerun/vim-polyglot"};
	use {"euclidianAce/BetterLua.vim", opt = true, ft = {"lua"}};
	use {"bfredl/nvim-luadev", opt = true, ft = {"lua"}};
	use {"OmniSharp/omnisharp-vim", opt = true, ft = {"cs"}};
	use {"lervag/vimtex", opt = true, ft = {"tex"}};
	--use {"slashmili/alchemist.vim", opt = true, ft = {"elixir", "eelixir"}};
	use {
		"iamcco/markdown-preview.nvim",
		opt = true,
		ft = {"markdown"},
		run = "cd app && yarn install"
	};

	-- LSP and linting
	use {"w0rp/ale"};
	use {"neovim/nvim-lspconfig"};
	use {"hrsh7th/nvim-compe"};
	use {"simrat39/symbols-outline.nvim"};
	use {"mfussenegger/nvim-jdtls"};

	-- Snippets
	use {"SirVer/ultisnips"};
	use {"honza/vim-snippets"};
	use {"mattn/emmet-vim", opt = true, ft = {"html", "css", "js", "ts"}};

	-- Misc
	use {"puremourning/vimspector"};
	use {"mbbill/undotree"};
	use {"preservim/nerdtree", opt = true, cmd = {"NERDTreeToggle", "NERDTree"}};
	use {"preservim/nerdcommenter"};
	use {"Raimondi/delimitMate"};
	use {"tpope/vim-fugitive"};
	use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}};
	use {"vim-utils/vim-man"};
	use {"preservim/tagbar"};
	use {"lyuts/vim-rtags"};
	use {"jremmen/vim-ripgrep"};
	use {
		"nvim-telescope/telescope.nvim",
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	};
	use {"nvim-telescope/telescope-fzy-native.nvim"};

	-- Themes
	use {"gruvbox-community/gruvbox", as = "gruvbox"};

	-- neorg
	use {
		"vhyrro/neorg",
		requires = "nvim-lua/plenary.nvim",
	}
end);

