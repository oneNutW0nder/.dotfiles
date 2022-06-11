--- Here goes a lot of time...
----------------------------------------------

-- TODO:
  -- Make snippets useful and the keybinds friendly
  -- Make jumping to definitions and things work with and without telescope (if there is only 1 place to go; don't open telesocpe)
  -- Make all of the lua files more organized with some kind of folder structure
  -- Get treesitter figured out and configured for actual use
  -- Get telescope binds figured out for actual use
  -- Get git integration and icons in the sign column (maybe something like LazyGit)
  --
  -- New project layout that will improve organization and hopefully load time!
    -- init.lua --> should only require 'config' and 'plugins' (maybe a 'utils')
      -- Everything will be configured in 'plugins' and settings contained in respective files in 'lua/config/'
    -- Layout will be similar to: https://github.com/alpha2phi/neovim-for-beginner


--
-- Begin External lua
--

require("onenutw0nder.keybinds")
require("onenutw0nder.settings")
require("onenutw0nder.plugins")
require("onenutw0nder.lsp-config")
require("onenutw0nder.telescope")
require("onenutw0nder.treesitter")
require("onenutw0nder.comments")
require("onenutw0nder.autopairs")

--
-- End External lua
--

----------------------------------------------

