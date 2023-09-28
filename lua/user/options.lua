lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "ruby",
  "rust",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enable = true
-- you need to install xclip to make copies in nvim to another place
-- In Ubuntu or Debian: sudo apt-get install xclip
lvim.builtin.copy_clipboard = {
  enabled = true,
  provider = "xclip"
}

lvim.builtin.telescope = {
  active = true,
  on_config_done = nil,
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
}

-- vim.opt.timeoutlen = 500
vim.opt.colorcolumn = '120'

-- Nvim treesitter-endwise config
require('nvim-treesitter.configs').setup {
  endwise = {
    enable = true,
  },
}

local luasnip = require("luasnip")
luasnip.snippets = {
  html = {}
}

luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html
luasnip.snippets.typescriptreact = luasnip.snippets.html

require("luasnip/loaders/from_vscode").load({ include = { "html" } })
require("luasnip/loaders/from_vscode").lazy_load()
require('luasnip').filetype_extend("javascriptreact", { "html" })

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "rubocop",
    filetypes = { "ruby" },
  },
}
