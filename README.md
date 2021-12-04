# dotfiles
configs that have taken hours from me

## TLDR
Dotfiles are managed with `stow`: https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

To install:

```bash
git clone $HOME/<this_repo>
cd .dotfiles    # This repo
stow [file]
```

Example:
```bash
git clone $HOME/<this_repo>
cd .dotfiles    # This repo
stow nvim       # Will create symlinks for nvim configuration 
```
