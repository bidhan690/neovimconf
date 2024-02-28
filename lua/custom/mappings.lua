local M = {}

M.general = {
  n = {
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "Tmux Navigate Left"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "Tmux Navigate Down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "Tmux Navigate Up"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "Tmux Navigate Right"},
  }
}

return M
