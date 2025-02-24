return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    vim.keymap.set('n', '<leader>A', function()
      harpoon:list():prepend()
    end)
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-m>', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<leader><C-h>', function()
      harpoon:list():replace_at(1)
    end)
    vim.keymap.set('n', '<leader><C-t>', function()
      harpoon:list():replace_at(2)
    end)
    vim.keymap.set('n', '<leader><C-n>', function()
      harpoon:list():replace_at(3)
    end)
    vim.keymap.set('n', '<leader><C-s>', function()
      harpoon:list():replace_at(4)
    end)

    -- Telescope like bindings
    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-x>', function()
          harpoon.ui:select_menu_item { split = true }
        end, { buffer = cx.bufnr })
      end,
    }
  end,
}
