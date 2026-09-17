vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true })
end
)

vim.keymap.set("c", "<C-A>", "<Home>")

--create a new terminal window with <Leader>t
vim.keymap.set("n", "<Leader>t", function()
  vim.cmd("botright new")
  vim.cmd("resize " .. math.floor(vim.o.lines / 2))

  vim.fn.termopen(vim.o.shell)
  vim.cmd("startinsert")
end)

--exit insert mode in the terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
