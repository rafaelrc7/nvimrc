vim.g.airline_powerline_fonts = true;
vim.g.airline_section_b = "%{vimcaps#statusline(1)} %{airline#util#wrap(airline#extensions#branch#get_head(),80)}";

