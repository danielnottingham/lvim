lvim.plugins = {
  -- colorschemes
  { "tomasr/molokai" },

  { "airblade/vim-gitgutter" },
  { "vim-test/vim-test" },
  { "ntpeters/vim-better-whitespace" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rails" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-surround" },
  { "tpope/vim-endwise" },
  { "prettier/vim-prettier" },
  { "RRethy/nvim-treesitter-endwise" },

  -- cmp plugins
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "github/copilot.vim" },

  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  -- todo-comments is a lua plugin for Neovim >= 0.8.0 to highlight and search for todo comments like TODO, HACK, BUG in your code base.
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },

  -- Persistence is a simple lua plugin for automated session management.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },

  -- Nvim-plugin for doing the opposite of join-line (J) of arguments, powered by treesitter
  {
    "AckslD/nvim-trevJ.lua",
    config = "require('trevj').setup()",
    init = function()
      vim.keymap.set("n", "<leader>j", function()
        require("trevj").format_at_cursor()
      end)
    end,
  },
}


table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      local ok, cmp = pcall(require, "copilot_cmp")
      if ok then cmp.setup({}) end
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
        }
      end, 100)
    end,
  }
)
