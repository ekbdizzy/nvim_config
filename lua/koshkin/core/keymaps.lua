vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "CLear search highlights"})

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment element" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement element" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split window equal size"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "CLose current split"})

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Switch between tabs with alt+num
for i = 1, 9 do
	vim.keymap.set("n", "<leader>t" .. i .. "", i .. "gt", { noremap = true, silent = true })
end

-- Resize windows with Alt + Arrow keys
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "<cmd>resize +4<CR>", { noremap = true, silent = true })

-- Navigate 4x faster when holding down Ctrl in normal mode
vim.keymap.set("n", "<C-j>", "4j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "4k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "4l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "4h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "4<Down>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "4<Up>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, silent = true })

-- For visual mode: x[nore]map
vim.keymap.set("x", "<C-j>", "4j", { noremap = true, silent = true })
vim.keymap.set("x", "<C-k>", "4k", { noremap = true, silent = true })
vim.keymap.set("x", "<C-h>", "4h", { noremap = true, silent = true })
vim.keymap.set("x", "<C-l>", "4l", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Down>", "4<Down>", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Up>", "4<Up>", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Right>", "e", { noremap = true, silent = true })

