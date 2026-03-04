vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk", silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights", silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment element", silent = true })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement element", silent = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", silent = true })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", silent = true })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split window equal size", silent = true })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split", silent = true })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab", silent = true })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab", silent = true })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab", silent = true })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab", silent = true })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab", silent = true })

-- Switch between tabs with alt+num
for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    vim.cmd("tabn " .. i)
  end, { noremap = true, silent = true })
end

-- Resize windows with Alt + Arrow keys
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "<cmd>resize +4<CR>", { noremap = true, silent = true })

-- Navigate 4x faster when holding down Ctrl in normal mode
vim.keymap.set("n", "<M-j>", "4j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", "4k", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "4l", { noremap = true, silent = true })
vim.keymap.set("n", "<M-h>", "4h", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Down>", "4<Down>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Up>", "4<Up>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Left>", "b", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-Right>", "e", { noremap = true, silent = true })

-- For visual mode: x[nore]map
vim.keymap.set("x", "<M-j>", "4j", { noremap = true, silent = true })
vim.keymap.set("x", "<M-k>", "4k", { noremap = true, silent = true })
vim.keymap.set("x", "<M-h>", "4h", { noremap = true, silent = true })
vim.keymap.set("x", "<M-l>", "4l", { noremap = true, silent = true })
-- vim.keymap.set("x", "<C-Down>", "4<Down>", { noremap = true, silent = true })
-- vim.keymap.set("x", "<C-Up>", "4<Up>", { noremap = true, silent = true })
-- vim.keymap.set("x", "<C-Left>", "b", { noremap = true, silent = true })
-- vim.keymap.set("x", "<C-Right>", "e", { noremap = true, silent = true })

