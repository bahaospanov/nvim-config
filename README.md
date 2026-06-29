# Neovim Config Backup

Base: [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) at commit `4b065ad` + local customizations.

## Files

```
custom-plugins/
  harpoon.lua
  markview.lua
  neo-tree.lua
  neogit.lua
  ufo.lua
  vim-tmux-navigator.lua
kickstart-base-commit.txt
kickstart-customizations.patch
lazy-lock.json
mason-tools.txt
CHEATSHEET.md
AGENT.md
```

## Prerequisites (fresh machine)

```bash
brew install neovim tree-sitter-cli
```

## What the patch changes

1. Nerd Font enabled (`vim.g.have_nerd_font = true`)
2. `basedpyright` added to LSP servers
3. `<leader>yp` — yanks `@relative/path:line` to clipboard
4. Custom statusline — git branch + diff stats + line:col; winbar shows file path
5. Enables `{ import = 'custom.plugins' }` to load custom plugin specs

## Usage

- **Backup** (live config → here): `/backup-nvim` skill in Claude Code
- **Restore** (here → `~/.config/nvim`): `/restore-nvim` skill in Claude Code
