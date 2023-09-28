local kind = require('user.kind')

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<Leader>tf"] = ":TestFile<CR>"
lvim.keys.normal_mode["<Leader>tt"] = ":TestNearest<CR>"
lvim.keys.normal_mode["<Leader>gd"] = ":Gdiff<CR>"

lvim.keys.normal_mode["<Leader>fg"] = "<cmd>Telescope live_grep<CR>"
lvim.keys.normal_mode["<Leader>ff"] = "<cmd>Telescope find_files hidden=true<CR>"

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  kind.cmp_kind.Reference .. " Find references"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua vim.lsp.buf.definition()<cr>",
  -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  kind.cmp_kind.Reference .. " Definitions"
}

-- map enter to ciw
vim.api.nvim_set_keymap('n', '<CR>', ':normal ciw<CR>a', { noremap = true, silent = true })
