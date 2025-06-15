# vim-fugitive Quick Reference

vim-fugitive is a powerful Vim plugin that provides a Git wrapper for Vim, allowing you to work with Git repositories directly from within the editor.

## Basic Commands

### Repository Status

- `:Git` or `:G` - Show Git status (like `git status`)
- `:Git status` - Show detailed repository status
- `:Git log` - Show commit history
- `:Git log --oneline` - Show condensed log

### Adding and Committing Changes

- `:Git add %` - Add current file
- `:Git add .` - Add all files
- `:Git commit` - Commit changes (opens editor for message)
- `:Git commit -m "message"` - Commit with inline message
- `:Git commit -a` - Add and commit all modified files

### Branches

- `:Git branch` - List branches
- `:Git checkout branch-name` - Switch to branch
- `:Git checkout -b new-branch` - Create and switch to new branch
- `:Git merge branch-name` - Merge branch

### Remote Repositories

- `:Git push` - Push changes
- `:Git pull` - Pull changes
- `:Git fetch` - Fetch changes without merging

## Advanced Commands

### Diff and Comparison

- `:Gdiffsplit` - Compare current file with committed version
- `:Gvdiffsplit` - Vertical diff split
- `:Git diff` - Show differences in repository
- `:Git diff --cached` - Show staged differences

### Browsing and Navigation

- `:Gedit` - Edit file from repository
- `:Gsplit` - Open file in split window
- `:Gread` - Read committed version of file
- `:Gwrite` - Write file and stage it

### History and Log

- `:Git log --follow %` - Follow history of current file
- `:Git show` - Show latest commit
- `:Git show HEAD~1` - Show previous commit
- `:G show !` - Show last referenced commit
	- بتقدر تشوف الـ commit message بتاع الحالى اللى انت واقف عليه
- `:Gclog` - Open commit log in quickfix list

## Status Window Keyboard Shortcuts

When in `:Git` (status window):

### Navigation

- `j/k` - Move up and down
- `<CR>` - Open file or folder
- `o` - Open in new window
- `gO` - Open in new tab
- `p` - Preview file

### File Management

- `s` - Stage/unstage file
- `u` - Unstage file
- `X` - Discard changes in file
- `=` - Show inline diff
- `>` - Show additional diff
- `<` - Hide diff

### Commit and Management

- `cc` - Commit changes
- `ca` - Amend last commit
- `ce` - Extend last commit
- `cw` - Reword last commit
- `czz` - Stash changes

## Additional Useful Commands

### Search and Navigation

- `:Git grep "text"` - Search in repository
- `:Git ls-files` - List all tracked files
- `:GBrowse` - Open file in browser (GitHub/GitLab)

### Undo and Fix

- `:Git reset HEAD~1` - Undo last commit
- `:Git reset --hard HEAD` - Hard reset
- `:Git checkout -- %` - Discard changes in current file
- `:Git clean -fd` - Remove untracked files

### Advanced Branching

- `:Git rebase main` - Rebase onto main branch
- `:Git cherry-pick commit-hash` - Cherry-pick specific commit
- `:Git stash` - Stash changes temporarily
- `:Git stash pop` - Restore last stash

## Useful Tips

### Suggested Mappings for .vimrc

Add these shortcuts to your `.vimrc`:

```vim
" fugitive shortcuts
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log --oneline<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git branch<CR>
```

### Efficient Usage Tips

- Use `:Git` instead of `git status` for interactive interface
- In status window, use `s` to quickly stage files
- Use `=` to see diffs without opening additional windows
- `cc` is quick for committing from status window
- Use `:Gdiffsplit` for detailed comparison before committing

### Working with Commit References

- After viewing a commit (pressing `<CR>` in log), use `!` to reference it
- `:Gedit !:path/to/file` - Open file from last viewed commit
- `:Git show !` - Show details of last referenced commit
- Use tab completion with `:Gedit !:<Tab>` to browse files

## Additional Resources

- Help: `:help fugitive`
- Full documentation: [github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- More examples: `:help fugitive-examples`