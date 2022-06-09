require("nvim-treesitter.configs").setup {

  ensure_installed = { "cpp", "c", "rust", "go", "lua" },
  highlight = {
    enable = true,
    disable = {  },
    additional_vim_regex_highlighting = true,
  },

}
