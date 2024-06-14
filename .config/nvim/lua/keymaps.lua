vim.g.mapleader = " "

local map = vim.keymap.set

-- Open Netrw
map("n", "<leader><left>", "<Cmd>Ex<CR>")

-- Copy
map("i", "<C-c>", "<C-o>yy")
map("n", "<C-c>", "yy")
map("v", "<C-c>", "y")

-- Delete
map("i", "<C-Del>", "<C-o>de")
map("n", "<S-Del>", "dd")
map("i", "<S-Del>", "<C-o>dd")

-- Undo
map("i", "<C-z>", "<C-o>u")
map("n", "<C-z>", "u")
map("v", "<C-z>", "uuu")

-- Jump paragraph
map({"n", "v"}, "<C-Up>", "{")
map({"n", "v"}, "<C-Down>", "}")
map("i", "<C-Up>", "<C-o>{")
map("i", "<C-Down>", "<C-o>}")

-- Move code snippet
map("i", "<A-Up>", "<Cmd>m .-2<CR>")
map("n", "<A-Up>", "<Cmd>m .-2<CR>")
map("v", "<A-Up>", ":m \'<-2<CR>gv")
map("i", "<A-Down>", "<Cmd>m .+1<CR>")
map("n", "<A-Down>", "<Cmd>m .+1<CR>")
map("v", "<A-Down>", ":m \'>+1<CR>gv")

-- Cancel search hilight
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })
