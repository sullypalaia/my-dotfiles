vim.keymap.set("n", " ", "<Nop>", {silent = true, remap = false})
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.relativenumber = true

--use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_hl(0, "lineNrAbove", {fg = "white", bold = false})
vim.api.nvim_set_hl(0, "lineNr", {fg = "white", bold = false})
vim.api.nvim_set_hl(0, "lineNrBelowe", {fg = "white", bold = false})

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

local undodir = os.getenv("XDG_DATA_HOME") or os.getenv("HOME") .. "/.local/share/nvim/undo"

local uv = vim.uv or vim.loop
uv.fs_mkdir(undodir, 493)

vim.opt.undofile = true
vim.opt.undodir = undodir

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false
})

--enable support for c++ modules
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--experimental-modules-support",
        "--background-index",
    }
})

--need to set these up after enabling module support for clangd
require("mason").setup({
      ui = {
          icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
          }
}})

require("mason-lspconfig").setup()

local cmp = require("cmp")

--set up cmp
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
