require('lualine').setup({
  options = {
    theme = 'auto',
  },
})

require('fidget').setup({
  progress = {
    ignore_done_already = true,
    display = {
      render_limit = 3,
    },
  },
})
