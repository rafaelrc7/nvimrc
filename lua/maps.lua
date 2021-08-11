local vimp = require('vimp');
local map = vim.api.nvim_set_keymap;

-- Map leader key to <space>
map("n", "<space>", "", {noremap = true});
vim.g.mapleader = " ";

-- Terminal
map("n", "<leader>tt", ":terminal<CR>", {});
map("n", "<leader>tj", ":bot 10new +terminal | setlocal nobuflisted<CR>", {});
map("n", "<leader>tl", ":botright vnew +terminal | setlocal nobuflisted<CR>", {});
map("t", "<C-e>", "<C-\\><C-n>", {});

-- Ctrl+s saves file
map("", "<C-s>", ":write<CR>", {silent=true});

-- Toggles file tree
map("", "<C-n>", ":NvimTreeToggle<CR>", {silent=true});

-- Toggle comment
map("", "<leader>/", "<leader>c<space>", {silent=true});

-- Esc removes highlight
map("n", "<Esc>", ":nohl<CR>", {silent=true});

-- Shift+M starts Markdown Preview
map("n", "<S-m>", ":MarkdownPreview<CR>", {silent=true, noremap=true});

-- Window navigation
map("", "<leader>h", ":wincmd h<CR>", {silent=true, noremap=true});
map("", "<leader>j", ":wincmd j<CR>", {silent=true, noremap=true});
map("", "<leader>k", ":wincmd k<CR>", {silent=true, noremap=true});
map("", "<leader>l", ":wincmd l<CR>", {silent=true, noremap=true});

-- Fugitive
map("n", "<leader>gs", ":G<CR>", {}); -- git status
map("n", "<leader>gdt", ":diffget //2<CR>", {});
map("n", "<leader>gdm", ":diffget //3<CR>", {});

-- Telescope
map("n", "<leader>fw", ":Telescope live_grep<CR>", {});
map("n", "<leader>ff", ":Telescope find_files<CR>", {});
map("n", "<leader>fb", ":Telescope buffers<CR>", {});
map("n", "<leader>ft", ":Telescope help_tags<CR>", {});
map("n", "<leader>fgs", ":Telescope git_status<CR>", {});
map("n", "<leader>fgc", ":Telescope git_commits<CR>", {});

-- Compe
local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true);
end

_G.tab_complete = function ()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>";
	else
		return t "<Tab>";
	end
end

_G.s_tab_complete = function ()
	if vim.fn.pumvisible() == 1 then
		return t "<C-p>";
	else
		return t "<S-Tab>";
	end
end

_G.cr_complete = function ()
	return vim.fn["compe#confirm"]( {keys = t "<Plug>" .. "delimitMateCR", mode = ""});
end

map("i", "<Tab>", "v:lua.tab_complete()", {noremap=true, expr=true});
map("s", "<Tab>", "v:lua.tab_complete()", {noremap=true, expr=true});
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {noremap=true, expr=true});
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {noremap=true, expr=true});

map("i", "<CR>", "v:lua.cr_complete()", {noremap=true, expr=true});
map("i", "<C-j>", "v:lua.cr_complete()", {noremap=true, expr=true});

vimp.inoremap({"silent", "expr"}, "<C-space>", "compe#complete()");
vimp.inoremap({"silent", "expr"}, "<C-e>", "compe#close('<C-e>')");
vimp.inoremap({"silent", "expr"}, "<C-f>", "compe#scroll({ 'delta': +4 })");
vimp.inoremap({"silent", "expr"}, "<C-d>", "compe#scroll({ 'delta': -4 })");

