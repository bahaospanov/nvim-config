# Neovim Config Export

Base: [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) at commit `4b065ad` + local customizations.

## Files

- `kickstart-base-commit.txt` — pinned upstream commit of kickstart.nvim
- `kickstart-customizations.patch` — diff against that commit (3 small `init.lua` changes)
- `custom-plugins/` — your plugin specs, drop-in for `lua/custom/plugins/`
- `lazy-lock.json` — exact plugin versions for reproducible installs
- `mason-tools.txt` — LSPs / formatters installed via Mason

## What the patch does

1. **Nerd Font enabled** (`vim.g.have_nerd_font = true`)
2. **basedpyright** LSP enabled in the `servers` table (replaces commented `pyright`)
3. **Uncomments** `{ import = 'custom.plugins' }` so kickstart loads your plugin files

## What's in `custom-plugins/`

- `ufo.lua` — better folding via `nvim-ufo` (`zR`/`zM` open/close all)
- `neogit.lua` — Magit-style git UI (`<leader>gg`)
- `neo-tree.lua` — file tree sidebar (`<leader>e` toggle)

## Prerequisites

```bash
brew install neovim tree-sitter-cli
```

`tree-sitter-cli` is required for nvim-treesitter to compile parsers.

## Recreate from scratch

```bash
# 1. Backup any existing config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null

# 2. Clone kickstart at the pinned base commit
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
cd ~/.config/nvim
git checkout "$(cat /path/to/export/kickstart-base-commit.txt)"

# 3. Apply the init.lua customizations
git apply /path/to/export/kickstart-customizations.patch

# 4. Drop in custom plugins
cp /path/to/export/custom-plugins/*.lua ~/.config/nvim/lua/custom/plugins/

# 5. Pin plugin versions for reproducibility
cp /path/to/export/lazy-lock.json ~/.config/nvim/lazy-lock.json

# 6. Launch nvim — lazy.nvim auto-installs from the lockfile
nvim
# If needed inside nvim:
#   :Lazy restore   (force install at locked versions)
#   :Mason          (install LSPs listed in mason-tools.txt)
```

## Mason tools

See `mason-tools.txt`. `basedpyright` is added via the `servers` table in `init.lua` and auto-installed through `mason-tool-installer.nvim`.

## Notes

- Customizations now live in `lua/custom/plugins/*.lua`. Each plugin is its own file, isolated from upstream kickstart code.
- Only `init.lua` ever conflicts with upstream pulls — and it's now down to a 3-line diff.
- To pull newer kickstart: `cd ~/.config/nvim && git pull`, then re-apply the patch (or accept conflicts and merge by hand).
