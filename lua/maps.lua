local vimp = require('vimp');
local map = vim.api.nvim_set_keymap;

-- Map leader key to <space>
map("n", "<space>", "", {noremap = true});
vim.g.mapleader = " ";

map("", "<C-s>", ":write<CR>", {silent=true});
map("", "<C-b>", ":NERDTreeToggle<CR>", {silent=true});
map("n", "<C-m>", ":Make<CR>", {silent=true});
map("", "<C-_>", "<leader>c<space>", {silent=true});
map("", "<leader>/", ":nohl<CR>", {silent=true});

-- Window navigation
map("", "<leader>h", ":wincmd h<CR>", {silent=true, noremap=true});
map("", "<leader>j", ":wincmd j<CR>", {silent=true, noremap=true});
map("", "<leader>k", ":wincmd k<CR>", {silent=true, noremap=true});
map("", "<leader>l", ":wincmd l<CR>", {silent=true, noremap=true});

-- Autocomplete
map("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap=true, expr=true});
map("i", "<s-TAB>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap=true, expr=true});

map("n", "<S-m>", ":MarkdownPreview<CR>", {silent=true, noremap=true});

-- Fugitive
map("n", "<leader>gs", ":G<CR>", {}); -- git status
map("n", "<leader>gdt", ":diffget //2<CR>", {});
map("n", "<leader>gdm", ":diffget //3<CR>", {});

-- Telescope
map("n", "<leader>tg", [[:lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], {noremap=true});
map("n", "<leader>tf", [[:lua require('telescope.builtin').find_files()<CR>]], {noremap=true});

-- Compe
vimp.inoremap({"silent", "expr"}, "<C-space>", "compe#complete()");
vim.cmd([[inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]])
vim.cmd([[inoremap <silent><expr> <C-j>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]])
vimp.inoremap({"silent", "expr"}, "<C-e>", "compe#close('<C-e>')");
vimp.inoremap({"silent", "expr"}, "<C-f>", "compe#scroll({ 'delta': +4 })");
vimp.inoremap({"silent", "expr"}, "<C-d>", "compe#scroll({ 'delta': -4 })");

