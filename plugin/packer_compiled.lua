-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rafael/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/rafael/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/rafael/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/rafael/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rafael/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/BetterLua.vim"
  },
  ale = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/ale"
  },
  delimitMate = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neorg = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/neorg"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nerdtree = {
    commands = { "NERDTreeToggle", "NERDTree" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/nerdtree"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jdtls"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/nvim-luadev"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["omnisharp-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmuxline.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/tmuxline.vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vim-man"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-rtags"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vim-rtags"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  vimcaps = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vimcaps"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vimpeccable"
  },
  vimspector = {
    loaded = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rafael/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NERDTree lua require("packer.load")({'nerdtree'}, { cmd = "NERDTree", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NERDTreeToggle lua require("packer.load")({'nerdtree'}, { cmd = "NERDTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'BetterLua.vim', 'nvim-luadev'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'emmet-vim'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType cs ++once lua require("packer.load")({'omnisharp-vim'}, { ft = "cs" }, _G.packer_plugins)]]
vim.cmd [[au FileType ts ++once lua require("packer.load")({'emmet-vim'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/cake.vim]], true)
vim.cmd [[source /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/cake.vim]]
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/cake.vim]], false)
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/csx.vim]], true)
vim.cmd [[source /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/csx.vim]]
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/csx.vim]], false)
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/omnisharplog.vim]], true)
vim.cmd [[source /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/omnisharplog.vim]]
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/omnisharplog.vim]], false)
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/rafael/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/rafael/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
