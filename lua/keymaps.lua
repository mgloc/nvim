-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit input mode by hitting the jj
vim.keymap.set('i', 'jj', '<Esc>')

-- Open file explorer
vim.keymap.set('n', '<leader>ss', vim.cmd.Ex, { desc = 'Open Ex' })

-- Recenter on big moves and note lines for find and replace
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Lists
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<leader>lk', '<cmd>lprev<CR>zz')
vim.keymap.set('n', '<leader>lj', '<cmd>lnext<CR>zz')

-- greatest remap ever (do not save to registry after replacing by pasting)
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Search and replace visual (god tier)
vim.keymap.set('v', '<leader>s', [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])

-- Remove ^M chars
vim.keymap.set('n', '<leader>gm', function()
  vim.cmd '%s/\r//g'
end, { desc = 'Remove all ^M characters' })

-- Quickfix
function ToggleQuickFix()
  vim.cmd(vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 and 'copen' or 'cclose')
end

vim.api.nvim_create_user_command('ToggleQuickFix', ToggleQuickFix, {})
vim.keymap.set('n', '<leader>q', ToggleQuickFix, { desc = 'Toogle [Q]uickfix list' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, { desc = 'Send [B]uffer diagnostics to [Q]list' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- CSVView
vim.keymap.set('n', '<leader>tc', '<cmd>CsvViewToggle<CR>', { desc = '[T]oogle [C]SV View' })

-- vim: ts=2 sts=2 sw=2 et
