# Neovim Configuration Summary

**Leader Key:** `<Space>`

---

## General

| Key | Description |
|-----|-------------|
| `<Esc>` | Clear search highlights |
| `<C-h/j/k/l>` | Move focus between windows |
| `<Esc><Esc>` (terminal) | Exit terminal mode |
| Arrow keys | Disabled (encourages hjkl) |

---

## Windows & Buffers

| Key / Command | Description |
|---------------|-------------|
| `:vsplit` (`:vs`) | Vertical split |
| `:split` (`:sp`) | Horizontal split |
| `<C-w>o` / `:only` | Close all other windows (keep buffers) |
| `<C-w>q` / `:q` | Close current window |
| `<C-w>=` | Equalize window sizes |
| `<C-w>_` | Maximize window height |
| `<C-w>\|` | Maximize window width |
| `<C-w>r` | Rotate windows |
| `<C-w>T` | Move window to new tab |
| `:bn` / `:bp` | Next / previous buffer |
| `:b <name>` | Switch to buffer by name (tab-complete) |
| `<leader><leader>` | Telescope buffer picker (fuzzy search open buffers) |
| `:ls` | List open buffers |
| `:bd` | Delete (close) current buffer |
| `:bd!` | Force close buffer (discard unsaved changes) |
| `:bw` | Wipeout buffer (fully remove from buffer list) |
| `:%bd \| e#` | Close all buffers except current |
| `:%bd` | Close all buffers |
| `:bd 3 5 7` | Close specific buffers by number (see `:ls`) |

---

## Tabs

| Key / Command | Description |
|---------------|-------------|
| `:tabnew` | Open a new empty tab |
| `:tabnew <file>` | Open file in a new tab |
| `:tabedit <file>` | Same as `:tabnew <file>` |
| `gt` / `gT` | Next / previous tab |
| `{N}gt` | Go to tab number N (1-indexed) |
| `:tabclose` (`:tabc`) | Close current tab |
| `:tabonly` (`:tabo`) | Close all other tabs |
| `:tabmove +1` / `-1` | Move tab right / left |
| `:tabmove 0` | Move tab to the beginning |
| `:tabmove` | Move tab to the end |
| `<C-w>T` | Move current window to a new tab |
| `:tabs` | List all tabs and their windows |

**Tabs vs buffers vs windows:** A *buffer* is a file loaded in memory. A *window* is a viewport into a buffer (splits create multiple windows). A *tab* is a collection of windows — think of it as a workspace/layout, not a file. You can have the same buffer visible in multiple tabs.

---

## Search (`<leader>s`)

| Key | Description |
|-----|-------------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep (live grep) |
| `<leader>sw` | Search current word |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope builtins |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim config files |
| `<leader>/` | Fuzzy find in current buffer |
| `<leader><leader>` | Find open buffers |

---

## LSP (`gr` prefix)

| Key | Description |
|-----|-------------|
| `grn` | Rename symbol |
| `gra` | Code action (normal + visual) |
| `grr` | Go to references |
| `gri` | Go to implementation |
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>th` | Toggle inlay hints |
| `<leader>q` | Diagnostic quickfix list |

---

## Git Hunks (`<leader>h`)

| Key | Description |
|-----|-------------|
| `]c` / `[c` | Next / previous git change |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset entire buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle line blame |
| `<leader>tD` | Toggle deleted inline |

---

## Debugging (DAP)

| Key | Description |
|-----|-------------|
| `<F5>` | Start / Continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle debug UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

---

## File Tree (NvimTree)

Toggle the tree with `<leader>n`. Press `?` inside the tree to see all keybindings.

### Opening Files

| Key | Description |
|-----|-------------|
| `<leader>n` | Toggle NvimTree |
| `<CR>` or `o` | Open file / toggle folder |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<Tab>` | Preview (keep cursor in tree) |

### Navigation

| Key | Description |
|-----|-------------|
| `j` / `k` | Move down / up |
| `h` | Collapse folder / go to parent |
| `l` | Expand folder / open file |
| `J` / `K` | Jump to last / first sibling |
| `P` | Go to parent directory |
| `-` | Navigate up one directory |

### File Operations

| Key | Description |
|-----|-------------|
| `a` | Create file or directory (trailing `/` = dir) |
| `d` | Delete file or directory |
| `r` | Rename |
| `e` | Basename-only rename |
| `c` | Copy to clipboard |
| `x` | Cut to clipboard |
| `p` | Paste from clipboard |
| `y` | Yank filename |
| `Y` | Yank absolute path |
| `gy` | Yank relative path |

### Tree Controls

| Key | Description |
|-----|-------------|
| `R` | Refresh tree |
| `E` | Expand all |
| `W` | Collapse all |
| `g.` | Toggle hidden / dotfiles |
| `S` | Search file (opens system finder) |
| `f` | Filter files (live filter) |
| `F` | Clear filter |
| `q` | Close tree |
| `?` | Show all keybindings (help) |

---

## Formatting

| Key | Description |
|-----|-------------|
| `<leader>f` | Format buffer (async, LSP fallback) |

---

## Theme

| Key / Command | Description |
|---------------|-------------|
| `<leader>tl` | Toggle dark/light mode |
| `:colorscheme vscode` | Set VS Code theme |
| `:Telescope colorscheme` | Browse all installed themes |

To permanently change the default mode, edit `vim.o.background` (set to `'dark'` or `'light'`) in `init.lua` under the vscode.nvim plugin config.

---

## Completion (blink.cmp)

| Key | Description |
|-----|-------------|
| `<C-space>` | Toggle completion menu |
| `<C-y>` | Accept completion |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<C-e>` | Close menu |
| `<C-k>` | Toggle signature help |
| `<Tab>` / `<S-Tab>` | Navigate snippet stops |

---

## Mini.nvim (Surround & Textobjects)

| Key | Description |
|-----|-------------|
| `saiw)` | Add surround around word |
| `sd'` | Delete surrounding quotes |
| `sr)'` | Replace surround `)` with `'` |
| `va)` / `vi)` | Select around/inside parens |

---

## Neogit (Git Interface)

Open Neogit with `:Neogit` (or bind it to a key of your choice).

### Status Buffer

| Key | Action |
|-----|--------|
| `j` / `k` | Move down / up |
| `<Tab>` / `za` | Toggle fold |
| `zo` | Open fold |
| `1` / `2` / `3` / `4` | Set fold depth |
| `s` | Stage hunk/file |
| `S` | Stage all unstaged |
| `<C-s>` | Stage everything |
| `u` | Unstage |
| `U` | Unstage all staged |
| `K` | Untrack file |
| `x` | Discard changes |
| `<CR>` | Go to file |
| `<S-CR>` | Peek file |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `o` | Open tree |
| `{` / `}` | Previous / next hunk header |
| `<C-k>` / `<C-j>` | Peek up / down |
| `<C-n>` / `<C-p>` | Next / previous section |
| `[c` / `]c` | Scroll diff up / down |
| `y` | Show refs |
| `Y` | Yank selected |
| `$` | Command history |
| `Q` | Run command |
| `<C-r>` | Refresh buffer |
| `I` | Init repo |
| `q` | Close |

### Popup Menus (from Status Buffer)

| Key | Popup |
|-----|-------|
| `?` | Help |
| `c` | Commit |
| `b` | Branch |
| `B` | Bisect |
| `p` | Pull |
| `P` | Push |
| `f` | Fetch |
| `l` | Log |
| `r` | Rebase |
| `m` | Merge |
| `v` | Revert |
| `A` | Cherry Pick |
| `Z` | Stash |
| `X` | Reset |
| `d` | Diff |
| `M` | Remote |
| `t` | Tag |
| `i` | Ignore |
| `w` | Worktree |

### Commit Editor

| Key | Action |
|-----|--------|
| `<C-c><C-c>` | Submit commit (normal + insert) |
| `<C-c><C-k>` | Abort commit (normal + insert) |
| `q` | Close (normal only) |
| `<M-p>` / `<M-n>` | Previous / next message |
| `<M-r>` | Reset message |

### Rebase Editor

| Key | Action |
|-----|--------|
| `p` | Pick |
| `r` | Reword |
| `e` | Edit |
| `s` | Squash |
| `f` | Fixup |
| `x` | Execute |
| `d` | Drop |
| `b` | Break |
| `gk` / `gj` | Move entry up / down |
| `<CR>` | Open commit |
| `<C-c><C-c>` | Submit (normal + insert) |
| `<C-c><C-k>` | Abort (normal + insert) |
| `[c` / `]c` | Scroll diff up / down |
| `q` | Close |

### Finder

| Key | Action |
|-----|--------|
| `<CR>` | Select |
| `<C-c>` / `<Esc>` | Close |
| `<C-n>` / `<Down>` | Next |
| `<C-p>` / `<Up>` | Previous |
| `<Tab>` | Insert completion |
| `<C-y>` | Copy selection |
| `<Space>` | Toggle multiselect next |
| `<S-Space>` | Toggle multiselect previous |

### Typical Workflow

**1. Open the status buffer**
Run `:Neogit` to open the status view in a new tab. You'll see sections for unstaged changes, staged changes, recent commits, etc.

**2. Review changes**
Navigate with `j`/`k`. Press `<Tab>` to expand/collapse files and hunks. Use `<CR>` to jump to a file, or `d` to open the Diffview popup for a side-by-side diff.

**3. Stage changes**
Move the cursor to a file or individual hunk and press `s` to stage it. Use `S` to stage all unstaged files at once, or `<C-s>` to stage everything. If you staged too much, press `u` to unstage.

**4. Commit**
Press `c` to open the Commit popup. Choose an option (e.g. `c` again for a normal commit). The commit editor opens in a new tab — write your message, then press `<C-c><C-c>` to submit or `<C-c><C-k>` to abort.

**5. Pull and push**
Press `p` to open the Pull popup and pull from upstream. Press `P` to open the Push popup and push your commits. Each popup shows available flags (force, rebase, etc.) that you can toggle before confirming.

**6. Branching**
Press `b` for the Branch popup. From there you can checkout, create, rename, or delete branches. Neogit uses Telescope for branch selection.

**7. View history**
Press `l` for the Log popup. Choose `l` again for the current branch log, or `a` for all branches. The log opens in a new tab with an ASCII commit graph.

**8. Stash work in progress**
Press `Z` for the Stash popup. Use `z` to stash, `p` to pop, `a` to apply, or `d` to drop a stash.

**9. Interactive rebase**
Press `r` for the Rebase popup. Choose `i` for interactive rebase. In the rebase editor, reorder commits with `gk`/`gj`, mark them with `p` (pick), `s` (squash), `f` (fixup), `r` (reword), or `d` (drop), then `<C-c><C-c>` to execute.

**10. Resolve conflicts**
After a merge or rebase conflict, the status buffer shows unmerged files. Open them with `<CR>`, fix the conflicts in the editor, then return to Neogit and stage the resolved files with `s`. Continue the rebase with `r` → continue, or complete the merge with `c` → commit.

### Amend a Commit

1. Stage your changes as usual (`s` on files/hunks)
2. Press `c` to open the Commit popup
3. Press `a` to **amend** — this opens the editor with the previous commit message pre-filled
4. Edit the message (or leave it as-is), then `<C-c><C-c>` to submit

To amend without changing the message: `c` → `e` (extend, amends without opening the editor).

### Push to Gerrit

Neogit's Push popup doesn't support arbitrary refspecs like `HEAD:refs/for/master` directly. Use the command runner instead:

1. From the status buffer, press `Q` to open the command prompt
2. Type: `push gerrit HEAD:refs/for/master`
3. Press `<CR>` to execute

This runs `git push gerrit HEAD:refs/for/master` under the hood.

### Configuration Notes

- **Open style:** `kind = "tab"` (status, log, stash, refs, commit select open in new tab; commit view in vsplit)
- **Graph style:** ASCII
- **Integrations:** Telescope (with fzf sorter), Diffview
- **Auto-refresh:** Enabled with filewatcher (1s interval)

---

## Treesitter Text Objects

| Key | Description |
|-----|-------------|
| `vaf` / `vif` | Select outer/inner function |
| `vac` / `vic` | Select outer/inner class |
| `vaa` / `via` | Select outer/inner argument/parameter |
| `daf`, `cif`, etc. | Works with any operator (delete, change, yank...) |
| `]m` / `[m` | Jump to next / previous function start |
| `]]` / `[[` | Jump to next / previous class start |
| `<leader>a` | Swap parameter with next |
| `<leader>A` | Swap parameter with previous |

**Treesitter context:** the enclosing function/class is pinned at the top of the window (max 3 lines) when scrolling inside long blocks.

---

## Python-Specific

- **LSP:** pyright (type checking, go-to-definition) + ruff (linting, formatting, import sorting)
- **Formatter:** ruff (fix + format, replaces black/isort)
- **Debugger:** debugpy (Launch file, FastAPI, FastAPI+SSL configs)

### Verifying the Setup

| Command | What it shows |
|---------|---------------|
| `:LspInfo` | Active LSP clients — should show `pyright` and `ruff` attached |
| `:Mason` | Mason package manager — `pyright`, `ruff`, `debugpy` should be installed |
| `:lua vim.diagnostic.setloclist()` | All diagnostics in a location list |
| `:lua print(vim.inspect(vim.lsp.get_clients()))` | Full details of all active LSP clients |

### LSP Keybindings (in a Python buffer)

| Key | Action |
|-----|--------|
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `grr` | Find all references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `gra` | Code actions (organize imports, quick fixes) |
| `grn` | Rename symbol across project |
| `K` | Hover docs for symbol under cursor |
| `gO` | Document symbols (outline of current file) |
| `gW` | Workspace symbols (search across project) |
| `<leader>th` | Toggle inlay hints |
| `<leader>q` | Open diagnostics quickfix list |

### Formatting

| Key / Command | Action |
|---------------|--------|
| `<leader>f` | Format buffer (runs ruff fix + ruff format) |
| `:lua require("conform").format()` | Same, explicit call |

### Debugging

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue debugging |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

Three debug configurations are available (select with `<F5>`):
1. **Launch file** — runs the current Python file
2. **FastAPI (Poetry)** — runs uvicorn with SSL on port 8001
3. **FastAPI (No SSL)** — runs uvicorn on port 8000
