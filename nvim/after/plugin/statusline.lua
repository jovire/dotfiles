local statusline = {}
local statusline_group = vim.api.nvim_create_augroup('custom_statusline', { clear = true })
vim.o.statusline = '%!v:lua.jr.statusline.setup()'

local c = {}
local lsp = {
  message = '',
  printed_done = false,
}

function statusline.set_colors()
  c.normal_bg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'bg')
  c.normal_fg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'fg')
  c.statusline_bg = vim.fn.synIDattr(vim.fn.hlID('Statusline'), 'bg')
  c.comment_fg = vim.fn.synIDattr(vim.fn.hlID('Comment'), 'fg')
  c.warning_fg = vim.fn.synIDattr(vim.fn.hlID('WarningMsg'), 'fg')
  c.error_fg = vim.fn.synIDattr(vim.fn.hlID('ErrorMsg'), 'fg')

  vim.cmd.hi('StItem guibg=' .. c.normal_fg .. ' guifg=' .. c.normal_bg .. ' gui=NONE')
  vim.cmd.hi('StItem2 guibg=' .. c.comment_fg .. ' guifg=' .. c.normal_bg .. ' gui=NONE')
  vim.cmd.hi('StSep guifg=' .. c.normal_fg .. ' guibg=' .. c.statusline_bg .. ' gui=NONE')
  vim.cmd.hi('StSep2 guifg=' .. c.comment_fg .. ' guibg=' .. c.statusline_bg .. ' gui=NONE')
  vim.cmd.hi('StErr guibg=' .. c.error_fg .. ' guifg=' .. c.normal_bg .. ' gui=bold')
  vim.cmd.hi('StErrSep guifg=' .. c.error_fg .. ' guibg=' .. c.statusline_bg .. ' gui=NONE')
  vim.cmd.hi('StWarn guibg=' .. c.warning_fg .. ' guifg=' .. c.normal_bg .. ' gui=bold')
  vim.cmd.hi('StWarnSep guifg=' .. c.warning_fg .. ' guibg=' .. c.statusline_bg .. ' gui=NONE')
end

local function print_lsp_progress()
  local message = vim.lsp.util.get_progress_messages()[1]
  if message and not lsp.printed_done then
    local percentage = message.percentage or 0
    local message_text = ''
    local percentage_text = ''
    if percentage > 0 then
      percentage_text = (' - %d%%%%'):format(percentage)
    end
    if message.message then
      message_text = (' (%s)'):format(message.message)
    end
    lsp.message = ('%s: %s%s%s'):format(message.name, message.title, message_text, percentage_text)
    if message.done then
      vim.defer_fn(function()
        lsp.printed_done = true
        print_lsp_progress()
      end, 300)
    end
  else
    lsp.message = ''
    lsp.printed_done = false
  end
end

vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
  group = statusline_group,
  pattern = '*',
  callback = statusline.set_colors,
})

vim.api.nvim_create_autocmd({ 'User' }, {
  group = statusline_group,
  pattern = 'LspProgressUpdate',
  callback = print_lsp_progress,
})

local function sep(item, opts, show)
  opts = opts or {}
  if show == nil then
    show = true
  end
  if not show then
    return ''
  end
  local no_after = opts.no_after or false
  local no_before = opts.no_before or false
  local sep_color = opts.sep_color or '%#StSep#'
  local color = opts.color or '%#StItem#'
  local side = opts.side or 'left'

  local sep_before = '█'
  local sep_after = '█'
  if side ~= 'left' then
    sep_before = '█'
    sep_after = '█'
  end

  if no_before then
    sep_before = '█'
  end

  if no_after then
    sep_after = '█'
  end

  return sep_color .. sep_before .. color .. item .. sep_color .. sep_after .. '%*'
end

local st_mode = { color = '%#StMode#', sep_color = '%#StModeSep#', no_before = true }
local st_err = { color = '%#StErr#', sep_color = '%#StErrSep#' }
local st_mode_right = vim.tbl_extend('force', st_mode, { side = 'right', no_before = false })
local st_err_right = vim.tbl_extend('force', st_err, { side = 'right' })
local st_warn = { color = '%#StWarn#', sep_color = '%#StWarnSep#', side = 'right', no_after = true }
local sec_2 = { color = '%#StItem2#', sep_color = '%#StSep2#' }

local function mode_highlight(mode)
  if mode == 'i' then
    vim.cmd.hi('StMode guibg=#83a598 guifg=#3c3836')
    vim.cmd.hi('StModeSep guifg=#83a598')
  elseif vim.tbl_contains({ 'v', 'V', '' }, mode) then
    vim.cmd.hi('StMode guibg=#fe8019 guifg=#3c3836')
    vim.cmd.hi('StModeSep guifg=#fe8019')
  elseif mode == 'R' then
    vim.cmd.hi('StMode guibg=#8ec07c guifg=#3c3836')
    vim.cmd.hi('StModeSep guifg=#8ec07c')
  else
    vim.cmd.hi('StMode guibg=' .. c.normal_fg .. ' guifg=' .. c.normal_bg .. ' gui=NONE')
    vim.cmd.hi('StModeSep guifg=' .. c.normal_fg .. ' guibg=' .. c.statusline_bg .. ' gui=NONE')
  end
end

local function mode_statusline()
  local mode = vim.fn.mode()
  mode_highlight(mode)
  local modeMap = {
    n = 'NORMAL',
    i = 'INSERT',
    R = 'REPLACE',
    v = 'VISUAL',
    V = 'V-LINE',
    c = 'COMMAND',
    [''] = 'V-BLOCK',
    s = 'SELECT',
    S = 'S-LINE',
    [''] = 'S-BLOCK',
    t = 'TERMINAL',
  }

  return modeMap[mode] or 'UNKNOWN'
end

local function with_icon(value, icon)
  if not value then
    return value
  end
  return icon .. ' ' .. value
end

local function git_statusline()
  local result = {}
  if vim.b.gitsigns_head then
    table.insert(result, vim.b.gitsigns_head)
  elseif vim.g.gitsigns_head then
    table.insert(result, vim.g.gitsigns_head)
  end
  if vim.b.gitsigns_status then
    table.insert(result, vim.b.gitsigns_status)
  end
  if #result == 0 then
    return ''
  end
  return with_icon(table.concat(result, ' '), '')
end

local function get_path()
  local full_path = vim.fn.expand('%:p')
  local path = full_path
  local cwd = vim.fn.getcwd()
  if path == '' then
    path = cwd
  end
  local stats = vim.loop.fs_stat(path)
  if stats and stats.type == 'directory' then
    return vim.fn.fnamemodify(path, ':~')
  end

  if full_path:match('^' .. cwd) then
    path = vim.fn.expand('%:.')
  else
    path = vim.fn.expand('%:~')
  end

  if #path < (vim.fn.winwidth(0) / 4) then
    return '%f'
  end

  return vim.fn.pathshorten(path)
end

function statusline.search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function lsp_status(severity)
  local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] })
  if count > 0 then
    return count .. ' ' .. severity:sub(1, 1)
  end
  return ''
end

local function get_modified_count()
  local bufnr = vim.api.nvim_get_current_buf()
  return #vim.tbl_filter(function(buf)
    return buf.listed
      and buf.changed
      and buf.bufnr ~= bufnr
      and vim.api.nvim_buf_get_option(buf.bufnr, 'buftype') ~= 'terminal'
  end, vim.fn.getbufinfo({ bufmodified = 1, buflisted = 1, bufloaded = 1 }))
end

local function statusline_active()
  local mode = mode_statusline()
  local git_status = git_statusline()
  local search = statusline.search_result()
  --local db_ui = vim.fn['db_ui#statusline']() or ''
  local ft = vim.bo.filetype
  local err = lsp_status('ERROR')
  local warn = lsp_status('WARN')
  local modified_count = get_modified_count()
  local statusline_sections = {
    sep(mode, st_mode),
    sep(git_status, sec_2, git_status ~= ''),
    sep(get_path(), vim.bo.modified and st_err or sec_2),
    sep(('+%d'):format(modified_count), st_err, modified_count > 0),
    sep(' - ', st_err, not vim.bo.modifiable),
    sep('%w', nil, vim.wo.previewwindow),
    sep('%r', nil, vim.bo.readonly),
    sep('%q', nil, vim.bo.buftype == 'quickfix'),
   -- sep(db_ui, sec_2, db_ui ~= ''),
    '%<',
    '%=',
    sep(lsp.message, vim.tbl_extend('keep', { side = 'right' }, sec_2), lsp.message ~= ''),
    sep(search, vim.tbl_extend('keep', { side = 'right' }, sec_2), search ~= ''),
    sep(ft, vim.tbl_extend('keep', { side = 'right' }, sec_2), ft ~= ''),
    sep('%l:%c', st_mode_right),
    sep('%p%%/%L', vim.tbl_extend('keep', { no_after = err == '' and warn == '' }, st_mode_right)),
    sep(err, vim.tbl_extend('keep', { no_after = warn == '' }, st_err_right), err ~= ''),
    sep(warn, st_warn, warn ~= ''),
    '%<',
  }

  return table.concat(statusline_sections, '')
end

local function statusline_inactive()
  return [[%f %y %m]]
end

function statusline.setup()
  local focus = vim.g.statusline_winid == vim.fn.win_getid()
  if focus then
    return statusline_active()
  end
  return statusline_inactive()
end

_G.jr.statusline = statusline
