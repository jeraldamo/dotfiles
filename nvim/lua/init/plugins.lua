return require('packer').startup(function(use)
  -- Themes
  use "lunarvim/colorschemes"
  use 'rmehri01/onenord.nvim'

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "Tastyep/structlog.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "L3MON4D3/LuaSnip"
  use "tpope/vim-fugitive"
  use 'famiu/bufdelete.nvim'
  use 'kbenzie/vim-spirv'

  -- Notify
  use {
    "rcarriga/nvim-notify",

    config = function()
      require("config.notify")
    end,
    requires = { "nvim-telescope/telescope.nvim" },
  }

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("config.which-key")
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  }
  use 'nvim-treesitter/playground'

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",

    -- config = function()
    --   require("config.telescope").setup()
    -- end,
  }

  -- Alpha
  use {
    'goolord/alpha-nvim',
    config = function()
      require('config.alpha')
    end
  }

  -- Feline
  use {
    'feline-nvim/feline.nvim',
    config = function()
      --require('config.feline')
      require('config.feline')
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    }
  }

  -- Gitsigns
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('config.gitsigns')
    end
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.bufferline')
    end
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('config.comment')
    end
  }

  -- Neo-tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    config = function()
      require('config.neo-tree')
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    }
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end
  }


  -------------------------------------------------------
  -- LSP
  -------------------------------------------------------
  use {
    'williamboman/nvim-lsp-installer',
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('config.lsp-installer')
      end
    }
  }

  -- Goto-preview
  use {
    'rmagatti/goto-preview',
    config = function()
      require('config.goto-preview')
    end
  }
  -- Nvim-GPS
  use {
    "SmiteshP/nvim-gps",
    config = function()
      require('config.gps')
    end,
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -------------------------------------------------------
  -- Completion
  -------------------------------------------------------
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.cmp')
    end,
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }
  }

end)
