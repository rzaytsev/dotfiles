-- https://github.com/wbthomason/packer.nvim
-- https://github.com/nvim-lua/kickstart.nvim

return require('packer').startup({

  function(use)
    -- https://github.com/kevinhwang91/nvim-bqf
    -- https://github.com/gelguy/wilder.nvim
    use 'wbthomason/packer.nvim'
    use { 'tpope/vim-sensible' }
    -- use 'mhinz/vim-startify'
    use 'tpope/vim-repeat'
    use {
      'Pocco81/AutoSave.nvim',
      config = function ()
        local autosave = require("autosave")
        autosave.setup()
      end
    }

    use { 'ntpeters/vim-better-whitespace' }

    use { 'NMAC427/guess-indent.nvim',
      config = function() require('guess-indent').setup {} end,
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup {
          char = '┊',
          show_trailing_blankline_indent = false,
        }
      end
    }

    use 'tpope/vim-surround'
    use 'windwp/nvim-spectre'
    use { 'tpope/vim-unimpaired' }

    use {
      'numToStr/Comment.nvim',
      config = function ()
        require('Comment').setup()
      end
    }
--
    use {
      'nvim-telescope/telescope.nvim',
      config = function()
        require('telescope').setup{
          defaults = {
            sorting_strategy = "ascending",
            mappings = {
              -- restore default behavior
              i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
              },
            },
          },
          pickers = {
            buffers = {
              ignore_current_buffer = true,
              sort_mru = true
            }
          },
        }
      end,
      requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup({
          -- signs = {
          --   add = { hl = 'GitGutterAdd', text = '+' },
          --   change = { hl = 'GitGutterChange', text = '~' },
          --   delete = { hl = 'GitGutterDelete', text = '_' },
          --   topdelete = { hl = 'GitGutterDelete', text = '‾' },
          --   changedelete = { hl = 'GitGutterChange', text = '~' },
          -- },
        })
      end
    }

    -- use {
    --   "beauwilliams/focus.nvim",
    --   config = function() require("focus").setup() end
    -- }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use 'mfussenegger/nvim-dap'
    use 'Pocco81/DAPInstall.nvim'

    use {
      'ray-x/lsp_signature.nvim',
      config = function()
        require('lsp_signature').setup()
      end
    }

    use { 'junegunn/fzf', run = './install --bin', }
    use 'junegunn/fzf.vim'
    use 'fatih/vim-go'
    use 'plasticboy/vim-markdown'
    use 'junegunn/rainbow_parentheses.vim'

    require('plugins.lsp').run(use)

  end,
  config = {
    enable = true,
    -- log = { level = 'debug' },
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
