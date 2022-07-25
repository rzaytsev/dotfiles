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
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["AutoSave.nvim"] = {
    config = { "\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\rautosave\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  fzf = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/NMAC427/guess-indent.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2n\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2#show_trailing_blankline_indent\1\tchar\bâ”Š\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\2;\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  neogen = {
    config = { "\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2ƒ\1\0\1\5\0\t\0\0145\1\b\0005\2\5\0006\3\1\0'\4\2\0B\3\2\0029\3\3\0039\3\4\3B\3\1\2=\3\4\0025\3\6\0=\3\a\2=\2\3\1=\1\0\0K\0\1\0\1\0\0\rvalidate\1\0\1\venable\2\1\0\0\fschemas\tjson\16schemastore\frequire\rsettingsV\0\0\2\0\5\0\t6\0\0\0009\0\1\0006\1\0\0009\1\2\0019\1\3\0019\1\4\1B\1\1\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvimì\a\1\2\b\0(\0™\0015\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\6\0006\6\2\0009\6\a\0069\6\b\0069\6\t\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\n\0006\6\2\0009\6\a\0069\6\b\0069\6\v\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\f\0006\6\2\0009\6\a\0069\6\b\0069\6\r\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\14\0006\6\2\0009\6\a\0069\6\b\0069\6\15\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\16\0006\6\2\0009\6\a\0069\6\b\0069\6\17\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\18\0006\6\2\0009\6\a\0069\6\b\0069\6\19\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\20\0006\6\2\0009\6\a\0069\6\b\0069\6\21\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\22\0003\6\23\0\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\24\0006\6\2\0009\6\a\0069\6\b\0069\6\25\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\26\0006\6\2\0009\6\a\0069\6\b\0069\6\27\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\28\0006\6\2\0009\6\a\0069\6\b\0069\6\29\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\30\0006\6\2\0009\6\a\0069\6\b\0069\6\31\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5 \0006\6!\0'\a\"\0B\6\2\0029\6#\6\18\a\2\0B\3\5\0016\3\2\0009\3$\0039\3%\3'\4&\0006\5\2\0009\5\a\0059\5\b\0059\5'\0054\6\0\0B\3\4\1K\0\1\0\15formatting\vFormat\29nvim_create_user_command\bapi\25lsp_document_symbols\22telescope.builtin\frequire\15<leader>so\16code_action\15<leader>ca\15references\15<leader>gr\vrename\15<leader>rn\20type_definition\14<leader>D\0\15<leader>wl\28remove_workspace_folder\15<leader>wr\25add_workspace_folder\15<leader>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\0É\5\1\0\15\0&\0S6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\3\0B\1\2\0015\1\5\0003\2\4\0=\2\6\0016\2\a\0009\2\b\0029\2\t\2'\3\n\0'\4\v\0006\5\a\0009\5\f\0059\5\r\5B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\3\n\0'\4\14\0006\5\a\0009\5\f\0059\5\15\5B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\3\n\0'\4\16\0006\5\a\0009\5\f\0059\5\17\5B\2\4\0016\2\0\0'\3\18\0B\2\2\0023\3\19\0006\4\a\0009\4\20\0045\5\22\0=\5\21\0046\4\0\0'\5\23\0B\4\2\0026\5\a\0009\5\24\0059\5\25\0059\5\26\5B\5\1\0029\6\27\0059\6\28\0069\6\29\6+\a\2\0=\a\30\0066\6\31\0009\a \0B\a\1\0A\6\0\4X\t\18€5\v!\0=\3\"\v=\5#\v9\f$\n8\f\f\1\15\0\f\0X\r\4€9\f$\n8\f\f\1\18\r\v\0B\f\2\0019\f$\n8\f\f\0029\f\2\f9\r%\4\18\14\v\0B\r\2\0A\f\0\1E\t\3\3R\tì\127K\0\1\0\28lsp_ensure_capabilities\tname\17capabilities\14on_attach\1\0\0\26get_installed_servers\vipairs\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bcoq\1\0\1\15auto_start\fshut-up\17coq_settings\6g\0\14lspconfig\15setloclist\14<leader>q\14goto_next\a]d\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\vjsonls\1\0\0\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2æ\5\0\0\5\0\27\0\0316\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\n\0=\2\v\0015\2\14\0005\3\f\0005\4\r\0=\4\b\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\2=\2\26\1B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\6\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aaa\21@parameter.outer\aia\21@parameter.inner\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/rainbow_parentheses.vim",
    url = "https://github.com/junegunn/rainbow_parentheses.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2ã\1\0\0\5\0\14\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\f\2=\2\r\1B\0\2\1K\0\1\0\fpickers\fbuffers\1\0\0\1\0\2\rsort_mru\2\26ignore_current_buffer\2\rdefaults\1\0\0\rmappings\6i\1\0\0\1\0\2\n<C-u>\1\n<C-d>\1\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\2;\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2æ\5\0\0\5\0\27\0\0316\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\0015\2\n\0=\2\v\0015\2\14\0005\3\f\0005\4\r\0=\4\b\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\2=\2\26\1B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\6\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aaa\21@parameter.outer\aia\21@parameter.inner\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
time([[Config for AutoSave.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\2;\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2n\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\2#show_trailing_blankline_indent\1\tchar\bâ”Š\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2ã\1\0\0\5\0\14\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\b\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\f\2=\2\r\1B\0\2\1K\0\1\0\fpickers\fbuffers\1\0\0\1\0\2\rsort_mru\2\26ignore_current_buffer\2\rdefaults\1\0\0\rmappings\6i\1\0\0\1\0\2\n<C-u>\1\n<C-d>\1\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\0025\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\2ƒ\1\0\1\5\0\t\0\0145\1\b\0005\2\5\0006\3\1\0'\4\2\0B\3\2\0029\3\3\0039\3\4\3B\3\1\2=\3\4\0025\3\6\0=\3\a\2=\2\3\1=\1\0\0K\0\1\0\1\0\0\rvalidate\1\0\1\venable\2\1\0\0\fschemas\tjson\16schemastore\frequire\rsettingsV\0\0\2\0\5\0\t6\0\0\0009\0\1\0006\1\0\0009\1\2\0019\1\3\0019\1\4\1B\1\1\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvimì\a\1\2\b\0(\0™\0015\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\6\0006\6\2\0009\6\a\0069\6\b\0069\6\t\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\n\0006\6\2\0009\6\a\0069\6\b\0069\6\v\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\f\0006\6\2\0009\6\a\0069\6\b\0069\6\r\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\14\0006\6\2\0009\6\a\0069\6\b\0069\6\15\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\16\0006\6\2\0009\6\a\0069\6\b\0069\6\17\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\18\0006\6\2\0009\6\a\0069\6\b\0069\6\19\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\20\0006\6\2\0009\6\a\0069\6\b\0069\6\21\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\22\0003\6\23\0\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\24\0006\6\2\0009\6\a\0069\6\b\0069\6\25\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\26\0006\6\2\0009\6\a\0069\6\b\0069\6\27\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\28\0006\6\2\0009\6\a\0069\6\b\0069\6\29\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5\30\0006\6\2\0009\6\a\0069\6\b\0069\6\31\6\18\a\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\4\5\0'\5 \0006\6!\0'\a\"\0B\6\2\0029\6#\6\18\a\2\0B\3\5\0016\3\2\0009\3$\0039\3%\3'\4&\0006\5\2\0009\5\a\0059\5\b\0059\5'\0054\6\0\0B\3\4\1K\0\1\0\15formatting\vFormat\29nvim_create_user_command\bapi\25lsp_document_symbols\22telescope.builtin\frequire\15<leader>so\16code_action\15<leader>ca\15references\15<leader>gr\vrename\15<leader>rn\20type_definition\14<leader>D\0\15<leader>wl\28remove_workspace_folder\15<leader>wr\25add_workspace_folder\15<leader>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\0É\5\1\0\15\0&\0S6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\3\0B\1\2\0015\1\5\0003\2\4\0=\2\6\0016\2\a\0009\2\b\0029\2\t\2'\3\n\0'\4\v\0006\5\a\0009\5\f\0059\5\r\5B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\3\n\0'\4\14\0006\5\a\0009\5\f\0059\5\15\5B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\3\n\0'\4\16\0006\5\a\0009\5\f\0059\5\17\5B\2\4\0016\2\0\0'\3\18\0B\2\2\0023\3\19\0006\4\a\0009\4\20\0045\5\22\0=\5\21\0046\4\0\0'\5\23\0B\4\2\0026\5\a\0009\5\24\0059\5\25\0059\5\26\5B\5\1\0029\6\27\0059\6\28\0069\6\29\6+\a\2\0=\a\30\0066\6\31\0009\a \0B\a\1\0A\6\0\4X\t\18€5\v!\0=\3\"\v=\5#\v9\f$\n8\f\f\1\15\0\f\0X\r\4€9\f$\n8\f\f\1\18\r\v\0B\f\2\0019\f$\n8\f\f\0029\f\2\f9\r%\4\18\14\v\0B\r\2\0A\f\0\1E\t\3\3R\tì\127K\0\1\0\28lsp_ensure_capabilities\tname\17capabilities\14on_attach\1\0\0\26get_installed_servers\vipairs\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bcoq\1\0\1\15auto_start\fshut-up\17coq_settings\6g\0\14lspconfig\15setloclist\14<leader>q\14goto_next\a]d\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\vjsonls\1\0\0\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\2>\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
