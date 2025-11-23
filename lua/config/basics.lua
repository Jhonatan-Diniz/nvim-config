vim.api.nvim_set_hl(0, "Normal", { bg="none"})
vim.api.nvim_set_hl(0, "NormalNC", { bg="none"})
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg="none"})
vim.api.nvim_set_hl(0, "StatusLine", {bg = "None"})
vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Case-sensitive if uppercase in search
vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.list = true
vim.opt.listchars = { tab = '» '}
vim.opt.scrolloff = 10

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "c", "cpp"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "javascript", "typescript", "json", "html", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Status line
-- Git branch function
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "  " .. branch .. " "
  end
  return ""
end

-- File type with icon
local function file_type()
  local ft = vim.bo.filetype
  local icons = {
    lua = "[LUA]",
    python = "[PY]",
    javascript = "[JS]",
    html = "[HTML]",
    css = "[CSS]",
    json = "[JSON]",
    markdown = "[MD]",
    vim = "[VIM]",
    sh = "[SH]",
  }

  if ft == "" then
    return "  "
  end

  return (icons[ft] or ft)
end

-- Word count for text files
local function word_count()
  local ft = vim.bo.filetype
  if ft == "markdown" or ft == "text" or ft == "tex" then
    local words = vim.fn.wordcount().words
    return "  " .. words .. " words "
  end
  return ""
end

-- File size
local function file_size()
  local size = vim.fn.getfsize(vim.fn.expand('%'))
  if size < 0 then return "" end
  if size < 1024 then
    return size .. "B "
  elseif size < 1024 * 1024 then
    return string.format("%.1fK", size / 1024)
  else
    return string.format("%.1fM", size / 1024 / 1024)
  end
end

-- Mode indicators with icons
local function mode_icon()
  local mode = vim.fn.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",  -- Ctrl-V
    c = "COMMAND",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK",  -- Ctrl-S
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL"
  }
  return modes[mode] or "  " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size

vim.cmd([[
  highlight StatusLineBold gui=NONE cterm=bold
]])

local function setup_dynamic_statusline()
  vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
    callback = function()
      vim.opt_local.statusline = "  %f %h%m%r │%= %{v:lua.file_type()} | %l:%c   %P "
    end
  })
end

setup_dynamic_statusline()
