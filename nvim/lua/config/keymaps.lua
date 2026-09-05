vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true })
end
)

vim.keymap.set("c", "<C-A>", "<Home>")
