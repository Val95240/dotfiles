-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete default lazy mappings

vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")

vim.keymap.del({ "n", "i", "v" }, "<M-j>")
vim.keymap.del({ "n", "i", "v" }, "<M-k>")

vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")

vim.keymap.del("n", "<leader>ur")
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")

vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>|")

vim.keymap.del("n", "<leader>qq")

vim.keymap.del("n", "<c-_>")
vim.keymap.del("t", "<C-h>")
vim.keymap.del("t", "<C-j>")
vim.keymap.del("t", "<C-k>")
vim.keymap.del("t", "<C-l>")
vim.keymap.del("t", "<c-_>")

vim.keymap.del({ "n", "x", "s" }, "<C-s>")

-- Set own mappings

-- Exit insert mode
vim.keymap.set("i", "kj", "<Esc>l")
vim.keymap.set("i", "Kj", "<Esc>l")
vim.keymap.set("i", "kJ", "<Esc>l")
vim.keymap.set("i", "KJ", "<Esc>l")

-- Alt-u to undo in insert mode
vim.keymap.set("i", "<M-u>", "<C-O>u")

-- Scroll
vim.keymap.set("n", "<C-j>", "<C-e>")
vim.keymap.set("n", "<C-k>", "<C-y>")

-- Move to window using the <alt> hjkl keys
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <alt> HJKL
vim.keymap.set("n", "<M-K>", "<CMD>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-J>", "<CMD>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-H>", "<CMD>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-L>", "<CMD>vertical resize +2<cr>", { desc = "Increase window width" })

---- Move Lines
vim.keymap.set("n", "-", "<CMD>m .+1<cr>==", { desc = "Move down", silent = true })
vim.keymap.set("n", "_", "<CMD>m .-2<cr>==", { desc = "Move up", silent = true })
vim.keymap.set("v", "-", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
vim.keymap.set("v", "_", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })

-- buffers
vim.keymap.set("n", "<C-l>", "<CMD>noh<cr>", { desc = "Clear hlsearch" })

vim.keymap.set("n", "<leader>w", "<CMD>update<CR>", { desc = "Update" })
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "Quit" })

vim.keymap.set("n", "<M-\\>", "<CMD>vsplit<CR>", { silent = true })
vim.keymap.set("n", "<M-|>", "<CMD>vsplit | enew<CR>", { silent = true })
vim.keymap.set("n", "<M-->", "<CMD>split<CR>", { silent = true })
vim.keymap.set("n", "<M-_>", "<CMD>split | enew<CR>", { silent = true })
vim.keymap.set("n", "<M-=>", "<C-w>=", { silent = true })

vim.keymap.set("n", "<leader>\\", "<CMD>vsplit<CR>", { desc = "which_key_ignore", silent = true })
vim.keymap.set("n", "<leader>|", "<CMD>vsplit | enew<CR>", { desc = "which_key_ignore", silent = true })
vim.keymap.set("n", "<leader>-", "<CMD>split<CR>", { desc = "which_key_ignore", silent = true })
vim.keymap.set("n", "<leader>_", "<CMD>split | enew<CR>", { desc = "which_key_ignore", silent = true })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "which_key_ignore", silent = true })

vim.keymap.set("n", "<leader>t", "<CMD>tab split<CR>", { desc = "which_key_ignore", silent = true })
vim.keymap.set("n", "<leader>T", "<CMD>tabnew<CR>", { desc = "which_key_ignore", silent = true })

vim.keymap.set("n", "<M-p>", "gT")
vim.keymap.set("n", "<M-n>", "gt")

vim.keymap.set("n", "<M-R>", "<CMD>tab split<CR>", { silent = true })
vim.keymap.set("n", "<M-T>", "<CMD>tabnew<CR>", { silent = true })

vim.keymap.set("n", "<M-P>", function()
  vim.cmd("tabmove " .. ((vim.fn.tabpagenr("$") + vim.fn.tabpagenr() - 1) % (vim.fn.tabpagenr("$") + 1)))
end)
vim.keymap.set("n", "<M-N>", function()
  vim.cmd("tabmove " .. ((vim.fn.tabpagenr() + 1) % (vim.fn.tabpagenr("$") + 1)))
end)

vim.keymap.set("n", "<M-<>", "<C-w>r")
vim.keymap.set("n", "<M->>", "<C-w>R")

vim.keymap.set("n", "<M-w>", "<C-w>c")
vim.keymap.set("n", "<M-W>", "<CMD>tabclose<CR>")
vim.keymap.set("n", "<leader>!", "<C-w>T", { desc = "Send to new tab" })

vim.keymap.set("n", "<leader>H", "<C-w>H", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>J", "<C-w>J", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>K", "<C-w>K", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>L", "<C-w>L", { desc = "which_key_ignore" })

vim.keymap.set("v", "q", "<C-c>")

vim.keymap.set("n", "<C-h>", "o<C-c>")

-- Delete mark
vim.keymap.set("n", "dm", "<CMD>execute 'delmarks ' . nr2char(getchar())<CR>", { desc = "Delete mark" })

-- Swap words
vim.keymap.set("n", "gt", "<CMD>NeoSwapNext<CR>", { desc = "Swap next word", silent = true })
vim.keymap.set("n", "gT", "<CMD>NeoSwapPrev<CR>", { desc = "Swap prev word", silent = true })

-- In command line, <C-P> and <C-N> act as <Up> and <Down> (i.e. search in history)
vim.keymap.set("c", "<C-S-p>", "<Up>")
vim.keymap.set("c", "<C-S-n>", "<Down>")

-- Terminal movements
vim.keymap.set("t", "<M-h>", "<CMD>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set("t", "<M-j>", "<CMD>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set("t", "<M-k>", "<CMD>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set("t", "<M-l>", "<CMD>wincmd l<cr>", { desc = "Go to right window" })

-- Help abbreviations
vim.cmd([[cabbrev <expr> h ((getcmdtype() == ':' && getcmdpos() <= 2)? 'vert h' : 'h')]])
vim.cmd([[cabbrev <expr> help ((getcmdtype() == ':' && getcmdpos() <= 5)? 'vert help' : 'help')]])
vim.cmd([[cabbrev <expr> H ((getcmdtype() == ':' && getcmdpos() <= 2)? 'tab h' : 'H')]])
vim.cmd([[cabbrev <expr> Help ((getcmdtype() == ':' && getcmdpos() <= 5)? 'tab help' : 'Help')]])

-- Mini.surround: S in visual mode (cf. `:help MiniSurround-vim-surround-config`)
vim.keymap.del('x', 'ys')
vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

-- Neovide mappings
vim.g.neovide_hide_mouse_when_typing = false

vim.g.neovide_scale_factor = 1.0
vim.keymap.set("n", "<C-+>", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.08
	vim.cmd("redraw!")
end, { desc = "Zoom in" })
vim.keymap.set("n", "<C-->", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.08
	vim.cmd("redraw!")
end, { desc = "Zoom out" })
