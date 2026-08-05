return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install("cmake", "c", "cpp", "lua", "html", "css", "hyprlang", "json")
    vim.treesitter.start()
  end
}
