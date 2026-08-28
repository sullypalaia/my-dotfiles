local namespace = vim.api.nvim_create_namespace("namespace")

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() 
    vim.hl.on_yank({timeout = 125})
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
