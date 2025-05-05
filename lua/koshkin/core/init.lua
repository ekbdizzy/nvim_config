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

-- Set higher log level for LSP debugging
vim.lsp.set_log_level("DEBUG")

-- Automatically show the log
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.cmd("LspStart pyright")
    vim.defer_fn(function()
      vim.cmd("edit $NVIM_LOG_FILE")
    end, 1000)
  end,
})
