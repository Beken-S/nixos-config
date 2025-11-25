-- Leader клавиша
vim.g.mapleader = " "

-- Mini-files
vim.keymap.set("n", "<Leader>t", ":lua MiniFiles.open()<CR>")

-- Навигация между окнами
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Разделение окна
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Вкладки
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<C-x>", ":BufferLineCloseOthers<CR>")

-- Разворачиваение подсказки
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
