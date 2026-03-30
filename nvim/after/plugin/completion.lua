require('blink.cmp').setup({
  completion = {
    documentation = { auto_show = true },
    menu = {
      draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          -- {'kind_icon', 'kind', gap = 1 }
          {'kind', gap = 1 }
        },
      },
    },
  },
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  fuzzy = {
    sorts = { 'exact', 'score', 'sort_text' },
    implementation = 'prefer_rust_with_warning',
  },
  sources = {
    min_keyword_length = 3,
  },
})
