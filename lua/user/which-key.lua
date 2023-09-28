local kind = require('user.kind')

local wk = lvim.builtin.which_key

wk.mappings["a"] = { ":Alpha<cr>", kind.icons.screen .. " Dashboard" }

wk.mappings["S"] = {
  name = " persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", kind.icons.clock .. " Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", kind.icons.clock .. " Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", kind.icons.exit .. " Quit without saving session" },
}

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  ' ' .. kind.cmp_kind.EnumMember .. " Search Word Under Cursor"
}

-- TODO: get copilot?
-- wk.mappings["G"] = {
--   name = ' ' .. kind.icons.hint .. " Github Copilot",
--   a = { ":lua require('copilot.suggestion').accept()<cr>", "Accept" },
--   n = { ":lua require('copilot.suggestion').next()<cr>", "Next" },
--   N = { ":lua require('copilot.suggestion').prev()<cr>", "Prev" },
--   d = { ":lua require('copilot.suggestion').dismiss()<cr>", "Dismiss" },
--   t = { ":lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Toggle Auto Trigger" },
-- }
