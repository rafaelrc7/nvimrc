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

map("", "<leader>h", ":wincmd h<CR>", {silent=true, noremap=true});
map("", "<leader>j", ":wincmd j<CR>", {silent=true, noremap=true});
map("", "<leader>k", ":wincmd k<CR>", {silent=true, noremap=true});
map("", "<leader>l", ":wincmd l<CR>", {silent=true, noremap=true});

map("i", "<TAB>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap=true, expr=true});
map("i", "<s-TAB>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap=true, expr=true});
map("i", "<C-space>", "coc#refresh()", {noremap=true, expr=true});

map("n", "<S-m>", ":MarkdownPreview<CR>", {silent=true, noremap=true});

-- vimpeccable

vimp.imap("<C-l>", "<Plug>(coc-snippets-expand)")
vimp.imap("<C-j>", "<Plug>(coc-snippets-expand-jump)")
vimp.imap({"silent"}, "gd", "<Plug>(coc-definition)");

