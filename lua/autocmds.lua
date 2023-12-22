local api = vim.api

local goGroup = api.nvim_create_augroup("go", { clear = true })
api.nvim_create_autocmd("Filetype", {
	pattern = "go",
	command = [[autocmd BufWritePost * silent !gofmt -w %]],
	group = goGroup,
})

local indentGroup = api.nvim_create_augroup("indent", { clear = true })
api.nvim_create_autocmd("FileType", {
	pattern = { "haskell", "cabal", },
	command = [[:setlocal shiftwidth=2 softtabstop=2 tabstop=8 expandtab]],
	group = indentGroup,
})
api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	command = [[:setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]],
	group = indentGroup,
})
api.nvim_create_autocmd("FileType", {
	pattern = "elixir",
	command = [[:setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab]],
	group = indentGroup,
})
api.nvim_create_autocmd("FileType", {
	pattern = "asm",
	command = [[:setlocal shiftwidth=8 tabstop=8]],
	group = indentGroup,
})

local trimGroup = api.nvim_create_augroup("trim", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[:%s/\s\+$//e]],
	group = trimGroup,
})

local neomuttGroup = api.nvim_create_augroup("neomutt", { clear = true })
api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*mutt-*",
	command = [[:setfiletype mail]],
	group = neomuttGroup,
})

