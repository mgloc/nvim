vim.filetype.add {
  extension = {
    arb = 'ruby',
  },
}

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
      {
        '<leader>F',
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          print('Autoformat ' .. (vim.g.disable_autoformat and 'disabled' or 'enabled'))
        end,
        mode = '',
        desc = '[F]ormat toggle autoformat',
      },
    },
    opts = {
      notify_on_error = true,
      notify_no_formatters = false,
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = {}
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match '/node_modules/' then
          return
        end
        return { timeout_ms = 1250, lsp_format = 'fallback' }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        ruby = { 'rubocop' },
        eruby = { 'erb_format' },
        yml = {},
        yaml = {},
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
