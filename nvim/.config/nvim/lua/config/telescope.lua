require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<ESC>"] = require("telescope.actions").close,
        ["<C-w>"] = require("telescope.actions.layout").toggle_preview,
      }
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    border = true,
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.45,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
      layout_config = { width = 0.50 },
    },
    git_files = {
      theme = "dropdown",
      layout_config = { width = 0.50, },
    },
    buffers = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
    quickfix = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
    grep_string = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
    treesitter = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
    diagnostics = {
      theme = "ivy",
      layout_config = { height = 0.25, --[[ preview = false ]] },
    },
    lsp_references = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
    lsp_definitions = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
    lsp_implementations = {
      theme = "ivy",
      layout_config = { height = 0.25 },

    },
    lsp_type_definitions = {
      theme = "ivy",
      layout_config = { height = 0.25 },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
