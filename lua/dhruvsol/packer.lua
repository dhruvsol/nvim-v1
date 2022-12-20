-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  
 use({
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    })
    use({
      "williamboman/mason-lspconfig.nvim",
      after = "mason.nvim",
      config = function()
        require("mason-lspconfig").setup()
      end,
    })
    use({
      "neovim/nvim-lspconfig",
      after = "mason-lspconfig.nvim",
      config = function()
        require("plugins.lsp.lsp")
      end,
      disable = disable_plugins.nvim_lspconfig,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
        local config = require("user_settings")
        if config.null_ls ~= nil then
          config.null_ls()
        end
      end,
      disable = disable_plugins.null_ls,
    })

    use({
      "tami5/lspsaga.nvim",
      cmd = "Lspsaga",
      disable = disable_plugins.lspsaga,
    })

    use({
      "simrat39/symbols-outline.nvim",
      cmd = {
        "SymbolsOutline",
        "SymbolsOutlineOpen",
        "SymbolsOutlineClose",
      },
      config = function()
        require("plugins.symbols-outline")
      end,
      disable = disable_plugins.symbols_outline,
    })

    use({
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
      disable = disable_plugins.friendly_snippets,
    })
    use({
      "L3MON4D3/LuaSnip",
      after = "friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").load()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
      disable = disable_plugins.luasnip,
    })
    use({
      "hrsh7th/nvim-cmp",
      after = "LuaSnip",
      config = function()
        require("plugins/cmp")
      end,
      disable = disable_plugins.nvim_cmp,
    })
    use({
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
      disable = disable_plugins.cmp_buffer,
    })
    use({
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
      disable = disable_plugins.cmp_path,
    })
    use({
      "hrsh7th/cmp-nvim-lsp",
      after = "nvim-cmp",
      disable = disable_plugins.cmp_nvim_lsp,
    })
    use({
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
      disable = disable_plugins.cmp_luasnip,
    })
    use({
      "hrsh7th/cmp-nvim-lua",
      ft = "lua",
      disable = disable_plugins.cmp_nvim_lua,
    })

    -- LSP signature.
    use({
      "ray-x/lsp_signature.nvim",
      event = "InsertEnter",
      -- Config of this plugin is in plugins/lsp/lsp.lua
      disable = disable_plugins.lsp_signature,
    })

    -- TODO: Do better lazyloading here for dap.
    use({
      "mfussenegger/nvim-dap",
      event = { "BufRead", "BufNewFile" },
      disable = disable_plugins.nvim_dap,
    })

    use({
      "Pocco81/dap-buddy.nvim",
      after = "nvim-dap",
      branch = "dev",
      commit = "3679132",
      config = function()
        require("plugins/dap")
      end,
      disable = disable_plugins.dap_install,
    })
    use({
      "rcarriga/nvim-dap-ui",
      after = "dap-buddy.nvim",
      config = function()
        require("plugins/dapui")
      end,
      disable = disable_plugins.nvim_dap_ui,
    })

    -- Terminal.
    use({
      "akinsho/toggleterm.nvim",
      keys = "<C-t>",
      module = { "toggleterm", "toggleterm.terminal" },
      config = function()
        require("plugins/toggleterm")
      end,
      disable = disable_plugins.toggleterm,
    })
  
  
end)

