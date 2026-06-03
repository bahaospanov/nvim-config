# Neovim

Modal text editor. Mode = what keys do.

## Modes

- **Normal** — navigate/commands. Default. `Esc` returns here.
- **Insert** — type text. Enter via `i`.
- **Append** - append text. Enter via `A`.
- **Visual** — select. Enter via `v`.
- **Command** — `:` prefix, runs commands.

## Move (Normal)

- `h j k l` — left/down/up/right
- `w` / `b` — next/prev word
- `0` / `$` — line start/end
- `gg` / `G` — file top/bottom
- `{n}G` — line n
- `/text` — search forward, `n` next, `N` prev
- `Ctrl+o` — jump back in jump list
- `Ctrl+i` — jump forward in jump list

## Edit (Normal)

- `i` insert before, `a` after, `o` new line below, `O` above
- `x` delete char, `dd` delete line, `yy` copy line, `p` paste
- `dw` delete word, `d$` to line end
- `u` undo,  `U` undo line,`Ctrl+r` redo
- `r{char}` replace char, `cw` change word

## Change
- `ce` change till the end of the word, same as `cw`
- `c$` discard till the end of line and type in changes

## Go commands g

- `gg` — go to file top
- `G` — go to file bottom
- `grd` — go to definition (default `gd`, remapped in this layout)
- `gD` — go to declaration
- `grr` — go to references (default `gr`, remapped in this layout)
- `gri` — go to implementation (default `gi`, remapped in this layout)
- `grn` — rename
- `gra` — code action
- `gt` / `gT` — next/prev tab
- `gf` — open file under cursor
- `g~` — toggle case (visual selection or motion)
- `gu` — lowercase (e.g. `guw` lowercases word)
- `gU` — uppercase (e.g. `gUw` uppercases word)
- `gv` — reselect last visual selection
- `gq` — format/wrap text (motion or visual)
- `g;` / `g,` — jump back/forward in change list

## Diagnostics (LSP errors)

- `]d` / `[d` — jump to next/prev diagnostic
- `K` — hover, show error detail under cursor
- `gra` — code action (auto-fix if available)
- `<leader>sd` — Telescope: all diagnostics in project
- `:lua vim.diagnostic.open_float()` — show full error in popup

## Visual

- `v` char, `V` line, `Ctrl+v` block
- Then `d` cut, `y` copy, `c` change

## Substitute Command s

- `:s/old/new` — replace first match on current line
- `:s/old/new/g` — replace all matches on current line
- `:%s/old/new/g` — replace all matches in file
- `:%s/old/new/gc` — replace all, confirm each (`y`/`n`/`a`/`q`)
- `:{n,m}s/old/new/g` — replace in line range n to m
- `:'<,'>s/old/new/g` — replace in visual selection (auto-filled after `V` then `:`)

Flags: `g` = all on line, `c` = confirm, `i` = case-insensitive, `I` = case-sensitive

## Files (Command)

- `:w` save, `:q` quit, `:wq` save+quit, `:q!` force quit
- `:e file` open file

## Windows

- `:split` / `:vsplit` — horizontal/vertical
- `:split | Terminal` - open Terminal in split
- `Ctrl+w` + `h/j/k/l` — switch
- `Ctrl+w` + `q` — close

## Tabs

- `:tabnew` — open new empty tab
- `:tabnew file` — open file in new tab
- `gt` / `gT` — next/prev tab
- `{n}gt` — go to tab n
- `:tabclose` — close current tab
- `:tabonly` — close all other tabs
- `:tabs` — list all tabs

## Tabby (tab rename plugin)

- `<leader>tr` — rename current tab (prompts for name)
- `<leader>tc` — clear tab name (revert to filename)

## Help

- `:help {topic}` — built-in docs
- `vimtutor` — interactive tutorial (run in shell)

---

# NeoTree

File explorer sidebar plugin.

## Open / Close

- `:Neotree toggle` — show/hide sidebar
- `:Neotree focus` — jump into tree

## Navigation

- `j` / `k` — move up/down
- `Enter` / `o` — open file or folder

## File Operations

- `a` add, `d` delete, `r` rename
- `c` copy, `x` cut, `p` paste

## View

- `R` refresh
- `H` toggle hidden files
- `Backspace` — zoom out (go to parent dir)
- `.` — set current dir as root

## Help

- `?` — show all keys
- `<C-d>` / `<C-u>` — scroll help window

---

# Neogit

Git UI plugin. Opens a status buffer with staged/unstaged changes.

## Open

- `:Neogit` — open Neogit status buffer

## Status Buffer

- `Tab` — toggle diff for file under cursor
- `s` — stage file/hunk, `u` — unstage
- `S` — stage all, `U` — unstage all
- `d` — open diff view
- `x` — discard changes

## Commits

- `c c` — commit (opens commit message editor)
- `c a` — amend last commit
- `c e` — extend last commit (amend without editing message)

## Branches

- `b b` — checkout branch
- `b c` — create and checkout branch
- `b l` — list branches

## Push / Pull / Fetch

- `p p` — push
- `F F` — pull (fetch + merge)
- `f f` — fetch

## Help

- `?` — show all key bindings
- `q` — close / go back

---

# Buffers

Open files in memory. Multiple buffers = multiple open files.

## Open / Close

- `:e file` — open file into buffer
- `:bd` — delete (close) current buffer
- `:bd!` — force close (discard unsaved changes)

## Navigate

- `:bn` / `:bp` — next/prev buffer
- `:b {name}` — jump to buffer by name (tab-complete works)
- `:b {n}` — jump to buffer by number

## List

- `:ls` — list all open buffers
  - `%` = current, `#` = alternate, `+` = unsaved

## Open Buffer in New Window

- `:sb {n}` — open buffer n in horizontal split
- `:vert sb {n}` — open buffer n in vertical split
- `:tab sb {n}` — open buffer n in new tab

Split = divides current window, both visible at same time. Tab = full separate screen, only one visible at a time (`gt`/`gT` to switch).

## Alternate Buffer

- `Ctrl+^` — toggle between current and last used buffer

## Save

- `:w` — save current buffer
- `:wa` — save all buffers

## Close All

- `:%bd` — delete all buffers
- `:%bd|e#` — delete all, reopen current file

---

# Telescope

Fuzzy finder plugin. Opens a floating popup: search input + results list + preview pane.

## Common Pickers

- `:Telescope find_files` — find file by name in project
- `:Telescope live_grep` — search text inside files
- `:Telescope buffers` — switch between open buffers
- `:Telescope oldfiles` — recently opened files
- `:Telescope help_tags` — search Neovim help docs
- `:Telescope keymaps` — browse all keymaps
- `:Telescope git_commits` — browse git commit history
- `:Telescope git_branches` — list and checkout branches
- `:Telescope git_status` — changed files (like git status)

## Inside the Popup

- Type to filter results
- `↑` / `↓` or `Ctrl+k` / `Ctrl+j` — move through results
- `Enter` — open selected
- `Ctrl+v` — open in vertical split
- `Ctrl+x` — open in horizontal split
- `Ctrl+t` — open in new tab (use instead of Enter to open without closing Telescope)
- `Esc` / `Ctrl+c` — close

## Multi-select

- `Tab` — toggle select item
- `Shift+Tab` — deselect
- `Enter` — open all selected
