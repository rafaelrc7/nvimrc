return require("packer").startup(function(use)
	-- Packer manages itself
	use {"wbthomason/packer.nvim"};

	-- Lua api for better mapping
	use {"svermeulen/vimpeccable"};

	use {"vim-airline/vim-airline"};
	use {"edkolev/tmuxline.vim", opt = true};
	use {"suxpert/vimcaps"};

	-- Syntax and language specific stuff
	use {"sheerun/vim-polyglot"};
	use {"euclidianAce/BetterLua.vim", opt = true, ft = {"lua"}};
	use {"OmniSharp/omnisharp-vim", opt = true, ft = {"cs"}};
	use {"lervag/vimtex", opt = true, ft = {"tex"}};
	use {"slashmili/alchemist.vim", opt = true, ft = {"elixir", "eelixir"}};
	use {
		"iamcco/markdown-preview.nvim",
		opt = true,
		ft = {"markdown"},
		run = "cd app && yarn install"
	};

	-- LSP and linting
	use {"w0rp/ale"};
	use {
		"neoclide/coc.nvim",
		branch = 'master',
		run = 'yarn install --frozen-lockfile',
	};

	-- Snippets
	use {"SirVer/ultisnips"};
	use {"honza/vim-snippets"};
	use {"mattn/emmet-vim", opt = true, ft = {"html", "css", "js", "ts"}};

	-- Misc
	use {"preservim/nerdcommenter"};
	use {"Raimondi/delimitMate"};

	use {"tpope/vim-fugitive"};
	use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}};
	use {"preservim/nerdtree", opt = true, cmd = {"NERDTreeToggle", "NERDTree"}};
	use {"vim-utils/vim-man"};
	use {"mbbill/undotree"};
	use {"nvim-telescope/telescope.nvim"};
	use {"preservim/tagbar"};
	use {"lyuts/vim-rtags", opt = true, ft = {"c", "cpp", "cmake", "makefile"}};
	use {"jremmen/vim-ripgrep"};


	-- Themes
	use {"tomasr/molokai", as = "molokai"};

end);

