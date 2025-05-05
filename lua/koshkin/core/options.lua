vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

--tabs & intendation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

--search setting
opt.ignorecase = true -- ignore cae when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color teminal)
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

--backspace
opt.backspace = "indent,eol,start" -- allow backspace on indentm end of line or insert mode start position

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register:w

--split windows
opt.splitright = true
opt.splitbelow = true
