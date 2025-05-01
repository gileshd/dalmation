vim.cmd('source ~/.config/nvim/lua/ghd/ghd-init.vim')
vim.g.python3_host_prog = '/Users/ghd/.pyenv/shims/python'

-- ## Auto commands ## --
-- Automatically enter insert mode when switching to a terminal buffer
vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter"}, {
  pattern = "term://*",
  command = "startinsert"
})
-- Automatically delete the terminal buffer when the shell process exits
vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*",
  command = "bd!"
})

require("ghd.packer")
require("ghd.remap")

-- ## LSP ## --
local lsp_active = true

function ToggleTypechecking()
  if lsp_active then
    vim.cmd("LspStop")
    lsp_active = false
    print("Type checking disabled")
  else
    vim.cmd("LspStart")
    lsp_active = true
    print("Type checking enabled")
  end
end

vim.api.nvim_set_keymap('n', '<localleader>tt', ':lua ToggleTypechecking()<CR>', {noremap = true, silent = true})
