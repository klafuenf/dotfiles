return {
  -- "github/copilot.vim",
  "navarasu/onedark.nvim",
  -- "folke/tokyonight.nvim",
  -- "folke/neodev.nvim",
  "editorconfig/editorconfig-vim",
  -- "tpope/vim-fugitive",
  {"folke/which-key.nvim", event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  -- "nvim-treesitter/nvim-treesitter",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- "imsnif/kdl.vim",
  "kspHeller/nc.vim",
  -- "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
}
