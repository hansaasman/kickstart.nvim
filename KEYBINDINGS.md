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
| `:bd` | Delete (close) current buffer |
| `:ls` | List open buffers |
| `:b <name>` | Switch to buffer by name (tab-complete) |

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

## File Tree

| Key | Description |
|-----|-------------|
| `<leader>n` | Toggle NvimTree |
| `\` | Reveal in Neo-tree |

---

## Formatting

| Key | Description |
|-----|-------------|
| `<leader>f` | Format buffer (async, LSP fallback) |

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

Accessed from the Neogit status view -- key popups include:

| Key | Popup |
|-----|-------|
| `?` | Help |
| `c` | Commit |
| `b` | Branch |
| `p` | Pull |
| `P` | Push |
| `f` | Fetch |
| `l` | Log |
| `r` | Rebase |
| `m` | Merge |
| `Z` | Stash |
| `d` | Diff |
| `X` | Reset |
| `s` / `u` | Stage / Unstage |
| `x` | Discard changes |

---

## Python-Specific

- **LSP:** pyright
- **Linter:** ruff-lsp
- **Formatter:** black + isort
- **Debugger:** debugpy (Launch file, FastAPI, FastAPI+SSL configs)
