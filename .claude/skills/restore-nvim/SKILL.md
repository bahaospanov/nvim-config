---
name: restore-nvim
description: Copy the iCloud backup nvim config into the live ~/.config/nvim. Run on this Mac (or a fresh machine) to apply backed-up plugin files and lockfile.
---

Restore Neovim config from this backup repo into the live config. The backup dir is the current project root — use `$(pwd)` in all commands.

BACKUP_DIR="$(pwd)"  # wherever this repo lives
LIVE_DIR="$HOME/.config/nvim"

## Pre-flight check

Verify `~/.config/nvim` exists:
```bash
ls "$HOME/.config/nvim/init.lua" 2>/dev/null || echo "MISSING"
```

If missing, tell user to clone kickstart first (see README) before running this skill.

Verify custom plugins target dir exists:
```bash
ls "$HOME/.config/nvim/lua/custom/plugins/" 2>/dev/null || echo "MISSING"
```

If missing, create it:
```bash
mkdir -p "$HOME/.config/nvim/lua/custom/plugins/"
```

## Steps

### 1. Copy custom plugin files

```bash
cp "$(pwd)/custom-plugins/"*.lua "$HOME/.config/nvim/lua/custom/plugins/"
```

Report which files were copied.

### 2. Copy lazy-lock.json

```bash
cp "$(pwd)/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"
```

### 3. Apply init.lua patch (if needed)

Check if patch is already applied:
```bash
cd "$HOME/.config/nvim"
git apply --check "$(pwd)/kickstart-customizations.patch" 2>&1
```

- Exit 0: apply it:
  ```bash
  git apply "$(pwd)/kickstart-customizations.patch"
  ```
- Already applied: skip, tell user.
- Other error: show error, tell user to apply manually.

### 4. Mason tools

Remind user: open `nvim`, run `:Mason` to install tools listed in `$(pwd)/mason-tools.txt`. Not auto-installed — Mason installs interactively.

### 5. Report summary

List all files written to `~/.config/nvim`. Remind user to run `:Lazy restore` inside nvim to pin plugin versions from lockfile.
