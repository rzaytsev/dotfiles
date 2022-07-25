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
    -- use {
    --   'kyazdani42/nvim-tree.lua',
    --   requires = {
    --     'kyazdani42/nvim-web-devicons', -- optional, for file icon
    --   },
    --   config = function() require('nvim-tree').setup {} end
    -- }   use 'b0o/schemastore.nvim'
    -- use {
    --   'feline-nvim/feline.nvim',
    --   after = "nvim-web-devicons",
    --   config = function()
    --     require('feline').setup({
    --       -- preset = 'noicon'
    --     })
    --   end
    -- }
    -- use 'preservim/vim-markdown'
    -- use {
    --   'iamcco/markdown-preview.nvim',
    --   run = 'mkdp#util#install()'
    -- }
    -- https://github.com/gelguy/wilder.nvim
    use {
      'Pocco81/AutoSave.nvim',
      config = function ()
        local autosave = require("autosave")
        autosave.setup()
      end
    }

    use { 'ntpeters/vim-better-whitespace' }

    -- use({
    --   "iamcco/markdown-preview.nvim",
    --   run = function() vim.fn["mkdp#util#install"]() end,
    -- })
    use {
      "danymat/neogen",
      config = function()
        require('neogen').setup {}
      end,
      requires = "nvim-treesitter/nvim-treesitter",
    }

    -- use {
    --   'windwp/nvim-autopairs',
    --   requires = {
    --     'hrsh7th/nvim-cmp',
    --     'nvim-treesitter/nvim-treesitter',
    --   },
    --   config = function()
    --     local npairs = require('nvim-autopairs')
    --     npairs.setup({
    --       -- check_ts = true
    --     })
    --     npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    --     npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
    --     npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
    --   end
    -- }
    -- use 'tpope/vim-sleuth'
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

    -- use {
    --   'jose-elias-alvarez/null-ls.nvim',
    --   config = function()
    --     local ls = require('null-ls')
    --     -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    --     ls.setup({
    --       sources = {
    --         ls.builtins.formatting.stylua,
    --         ls.builtins.formatting.gofmt,
    --         ls.builtins.formatting.prettierd,
    --         ls.builtins.formatting.terraform_fmt,
    --         ls.builtins.formatting.uncrustify,
    --         -- ls.builtins.formatting.hadolint,
    --       },
    --     })
    --   end
    -- }
    -- use 'glepnir/dashboard-nvim'
    use 'tpope/vim-surround'
    use 'windwp/nvim-spectre'
    use 'dyng/ctrlsf.vim'
    use {
      'marko-cerovac/material.nvim',
    }

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


    require('plugins.treesitter').run(use)
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
