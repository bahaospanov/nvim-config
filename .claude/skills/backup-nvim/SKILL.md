---
name: backup-nvim
description: Copy live ~/.config/nvim changes into the iCloud backup repo and regenerate the patch file. Run on this Mac after editing the live nvim config.
---

Sync live Neovim config into this backup repo. The backup dir is the current project root — use `$(pwd)` to reference it in all commands.

LIVE_DIR="$HOME/.config/nvim"
BACKUP_DIR="$(pwd)"  # wherever this repo lives

## Steps

### 1. Sync custom plugin files

```bash
cp "$HOME/.config/nvim/lua/custom/plugins/"*.lua "$(pwd)/custom-plugins/"
```

Report which files were copied.

### 2. Sync lazy-lock.json

```bash
cp "$HOME/.config/nvim/lazy-lock.json" "$(pwd)/lazy-lock.json"
```

### 3. Regenerate kickstart-customizations.patch

The live `~/.config/nvim` is a kickstart.nvim git clone. Generate a patch of `init.lua` relative to the pinned base commit:

```bash
BASE=$(cat "$(pwd)/kickstart-base-commit.txt")
cd "$HOME/.config/nvim"
git diff "$BASE" -- init.lua > "$(pwd)/kickstart-customizations.patch"
```

If `git diff` fails (detached HEAD, no git history), warn: patch cannot be regenerated automatically, must update manually.

If patch output is empty, warn: either init.lua has no customizations vs base, or base commit is wrong.

### 4. Report summary

List all files updated. Remind user: commit from this Mac with `git add <files by name>` (never `git add -A`) then push.
