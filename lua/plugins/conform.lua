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
    },
    opts = {
      notify_on_error = true,
      notify_no_formatters = true,
      format_on_save = {
        timeout_ms = 1250,
        lsp_fallback = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        ruby = { 'rubocop' },
        eruby = { 'erb_format' },
        ylm = {},
        yaml = {},
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
