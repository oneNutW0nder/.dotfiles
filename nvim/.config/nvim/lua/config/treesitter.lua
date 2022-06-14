require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {  },
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  textObjects = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
