local g = vim.g;

g.airline_powerline_fonts = true;
g.airline_section_b = "%{vimcaps#statusline(1)} %{airline#util#wrap(airline#extensions#branch#get_head(),80)}";

g.tex_flavor = "latex";

g.vimtex_view_general_viewer = "qpdfview";
g.vimtex_view_general_options = [[--unique @pdf\#src:@tex:@line:@col]];
g.vimtex_view_general_options_latexmk = "--unique";

g.UltiSnipsExpandTrigger="<C-j>";
g.UltiSnipsJumpForwardTrigger="<c-b>";
g.UltiSnipsJumpBackwardTrigger="<c-z>";

g.OmniSharp_server_use_mono = true;

g.ale_linters_explicit = true;
