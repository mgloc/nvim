function pickTheme(theme)
  theme = theme or 'rose-pine-moon'
  vim.cmd.colorscheme(theme)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'erikbackman/brightburn.vim',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = true,
        styles = {
          italic = false,
        },
      }
      pickTheme()
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = {},
    config = function()
      pickTheme 'tokyonight'
    end,
  },
}
