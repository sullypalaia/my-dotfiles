vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "lua",
    callback = function()
      vim.lsp.enable("lua_ls")
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = { "cpp", "cppm", "h", "hpp", "cc", "cxx" },
    callback = function()
      vim.lsp.enable("clangd")
    end
  }
)

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--experimental-modules-support"
  }
})

vim.opt.completeopt:prepend("noselect")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
        commit_characters = false
      })
    end
  end
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
