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
local package_path_str = "/Users/rzaytsev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rzaytsev/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rzaytsev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rzaytsev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rzaytsev/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\rautosave\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/NMAC427/guess-indent.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tchar\bâ”Š#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nà\1\0\0\6\0\f\0\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0004\4\6\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\4\0059\5\a\5>\5\3\0049\5\3\0009\5\4\0059\5\b\5>\5\4\0049\5\3\0009\5\4\0059\5\t\5>\5\5\4=\4\v\3B\1\2\1K\0\1\0\fsources\1\0\0\15uncrustify\18terraform_fmt\14prettierd\ngofmt\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nƒ\1\0\1\6\0\t\0\0145\1\b\0005\2\5\0006\3\1\0'\5\2\0B\3\2\0029\3\3\0039\3\4\3B\3\1\2=\3\4\0025\3\6\0=\3\a\2=\2\3\1=\1\0\0K\0\1\0\1\0\0\rvalidate\1\0\1\venable\2\1\0\0\fschemas\tjson\16schemastore\frequire\rsettingsV\0\0\4\0\5\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\0029\2\4\2B\2\1\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvimì\a\1\2\n\0(\0™\0015\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0006\a\2\0009\a\a\a9\a\b\a9\a\19\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0003\a\23\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0006\a\2\0009\a\a\a9\a\b\a9\a\25\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0006\a\2\0009\a\a\a9\a\b\a9\a\27\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\28\0006\a\2\0009\a\a\a9\a\b\a9\a\29\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\30\0006\a\2\0009\a\a\a9\a\b\a9\a\31\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6 \0006\a!\0'\t\"\0B\a\2\0029\a#\a\18\b\2\0B\3\5\0016\3\2\0009\3$\0039\3%\3'\5&\0006\6\2\0009\6\a\0069\6\b\0069\6'\0064\a\0\0B\3\4\1K\0\1\0\15formatting\vFormat\29nvim_create_user_command\bapi\25lsp_document_symbols\22telescope.builtin\frequire\15<leader>so\16code_action\15<leader>ca\15references\15<leader>gr\vrename\15<leader>rn\20type_definition\14<leader>D\0\15<leader>wl\28remove_workspace_folder\15<leader>wr\25add_workspace_folder\15<leader>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\0É\5\1\0\17\0&\0S6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0015\1\5\0003\2\4\0=\2\6\0016\2\a\0009\2\b\0029\2\t\2'\4\n\0'\5\v\0006\6\a\0009\6\f\0069\6\r\6B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\4\n\0'\5\14\0006\6\a\0009\6\f\0069\6\15\6B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\4\n\0'\5\16\0006\6\a\0009\6\f\0069\6\17\6B\2\4\0016\2\0\0'\4\18\0B\2\2\0023\3\19\0006\4\a\0009\4\20\0045\5\22\0=\5\21\0046\4\0\0'\6\23\0B\4\2\0026\5\a\0009\5\24\0059\5\25\0059\5\26\5B\5\1\0029\6\27\0059\6\28\0069\6\29\6+\a\2\0=\a\30\0066\6\31\0009\b \0B\b\1\0A\6\0\4X\t\18€5\v!\0=\3\"\v=\5#\v9\f$\n8\f\f\1\15\0\f\0X\r\4€9\f$\n8\f\f\1\18\14\v\0B\f\2\0019\f$\n8\f\f\0029\f\2\f9\14%\4\18\16\v\0B\14\2\0A\f\0\1E\t\3\3R\tìK\0\1\0\28lsp_ensure_capabilities\tname\17capabilities\14on_attach\1\0\0\26get_installed_servers\vipairs\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bcoq\1\0\1\15auto_start\fshut-up\17coq_settings\6g\0\14lspconfig\15setloclist\14<leader>q\14goto_next\a]d\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\vjsonls\1\0\0\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\næ\5\0\0\6\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\b\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\3=\3\26\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\6\aif\20@function.inner\aaa\21@parameter.outer\aic\17@class.inner\aac\17@class.outer\aia\21@parameter.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\21node_incremental\bgrn\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/rainbow_parentheses.vim",
    url = "https://github.com/junegunn/rainbow_parentheses.vim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nã\1\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\fpickers\fbuffers\1\0\0\1\0\2\rsort_mru\2\26ignore_current_buffer\2\rdefaults\1\0\0\rmappings\6i\1\0\0\1\0\2\n<C-u>\1\n<C-d>\1\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/rzaytsev/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nƒ\1\0\1\6\0\t\0\0145\1\b\0005\2\5\0006\3\1\0'\5\2\0B\3\2\0029\3\3\0039\3\4\3B\3\1\2=\3\4\0025\3\6\0=\3\a\2=\2\3\1=\1\0\0K\0\1\0\1\0\0\rvalidate\1\0\1\venable\2\1\0\0\fschemas\tjson\16schemastore\frequire\rsettingsV\0\0\4\0\5\0\t6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\0029\2\4\2B\2\1\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvimì\a\1\2\n\0(\0™\0015\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0006\a\2\0009\a\a\a9\a\b\a9\a\19\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0003\a\23\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0006\a\2\0009\a\a\a9\a\b\a9\a\25\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0006\a\2\0009\a\a\a9\a\b\a9\a\27\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\28\0006\a\2\0009\a\a\a9\a\b\a9\a\29\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\30\0006\a\2\0009\a\a\a9\a\b\a9\a\31\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6 \0006\a!\0'\t\"\0B\a\2\0029\a#\a\18\b\2\0B\3\5\0016\3\2\0009\3$\0039\3%\3'\5&\0006\6\2\0009\6\a\0069\6\b\0069\6'\0064\a\0\0B\3\4\1K\0\1\0\15formatting\vFormat\29nvim_create_user_command\bapi\25lsp_document_symbols\22telescope.builtin\frequire\15<leader>so\16code_action\15<leader>ca\15references\15<leader>gr\vrename\15<leader>rn\20type_definition\14<leader>D\0\15<leader>wl\28remove_workspace_folder\15<leader>wr\25add_workspace_folder\15<leader>wa\19signature_help\n<C-k>\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\0É\5\1\0\17\0&\0S6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0015\1\5\0003\2\4\0=\2\6\0016\2\a\0009\2\b\0029\2\t\2'\4\n\0'\5\v\0006\6\a\0009\6\f\0069\6\r\6B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\4\n\0'\5\14\0006\6\a\0009\6\f\0069\6\15\6B\2\4\0016\2\a\0009\2\b\0029\2\t\2'\4\n\0'\5\16\0006\6\a\0009\6\f\0069\6\17\6B\2\4\0016\2\0\0'\4\18\0B\2\2\0023\3\19\0006\4\a\0009\4\20\0045\5\22\0=\5\21\0046\4\0\0'\6\23\0B\4\2\0026\5\a\0009\5\24\0059\5\25\0059\5\26\5B\5\1\0029\6\27\0059\6\28\0069\6\29\6+\a\2\0=\a\30\0066\6\31\0009\b \0B\b\1\0A\6\0\4X\t\18€5\v!\0=\3\"\v=\5#\v9\f$\n8\f\f\1\15\0\f\0X\r\4€9\f$\n8\f\f\1\18\14\v\0B\f\2\0019\f$\n8\f\f\0029\f\2\f9\14%\4\18\16\v\0B\14\2\0A\f\0\1E\t\3\3R\tìK\0\1\0\28lsp_ensure_capabilities\tname\17capabilities\14on_attach\1\0\0\26get_installed_servers\vipairs\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bcoq\1\0\1\15auto_start\fshut-up\17coq_settings\6g\0\14lspconfig\15setloclist\14<leader>q\14goto_next\a]d\14goto_prev\15diagnostic\a[d\6n\bset\vkeymap\bvim\vjsonls\1\0\0\0\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nà\1\0\0\6\0\f\0\0296\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0004\4\6\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\4\0059\5\a\5>\5\3\0049\5\3\0009\5\4\0059\5\b\5>\5\4\0049\5\3\0009\5\4\0059\5\t\5>\5\5\4=\4\v\3B\1\2\1K\0\1\0\fsources\1\0\0\15uncrustify\18terraform_fmt\14prettierd\ngofmt\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nã\1\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\fpickers\fbuffers\1\0\0\1\0\2\rsort_mru\2\26ignore_current_buffer\2\rdefaults\1\0\0\rmappings\6i\1\0\0\1\0\2\n<C-u>\1\n<C-d>\1\1\0\1\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tchar\bâ”Š#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
time([[Config for AutoSave.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\næ\5\0\0\6\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\b\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\3=\3\26\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\6\aif\20@function.inner\aaa\21@parameter.outer\aic\17@class.inner\aac\17@class.outer\aia\21@parameter.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\21node_incremental\bgrn\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
