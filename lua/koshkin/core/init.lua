require("koshkin.core.options")
require("koshkin.core.keymaps")

-- Enable mode keys in RU layout
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Python
local python_venv_path = os.getenv("PYTHON_NVIM_VENV")
vim.g.python3_host_prog = python_venv_path
vim.g.black_linelength = 120

-- Make diagnostics clearly visible
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

