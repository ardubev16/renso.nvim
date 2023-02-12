# Renso.nvim

My awesome Neovim configuration

## Installation

To install this config just copy these files to `~/.config/nvim/` or create a symlink to this repo in the same directory. You will need a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) installed to see all the pretty icons.

## Keybindings

You can find out about other keybindings by starting one (most likely with `<space>`). The main commands and categories are the following:

- `<space>x`: Close current buffer.
- `<space>e`: Open and close NvimTree.
- `<space>Y`: Copy the whole file to the clipboard.
- `<space>y`: Works like `y`, but copies to the clipboard.
- `<C-\>`: Open a terminal inside Neovim, use the same keybinding to close it.

### Help

Here you can find help for all commands, keymaps, options, etc. Just select what you want help with by pressing `<space>h`.

### LSP

You can use `<space>l` to see diagnostics for the opened files, `<space>lt` to see all the TODO, FIXME, NOTE, etc. in the current working directory.

- `gl`: Show diagnostics for the current line.
- `gd`: Go to the definition of the function / class / method / type under the cursor.
- `gr`: Show references to this function / class / method / type.
- `K`: Open documentation about function / class under cursor.
- `KK`: Open and navigate documentation.
- `<M-l>`: Accept Copilot's suggestions.
- `<C-f>`: scroll documentation downwards.
- `<C-b>`: scroll documentation upwards.
- `<C-e>`: close autocomplete list.
- `<C-n>`: next list item.
- `<C-p>`: previous list item.

### Code

- `<space>cg`: Open a ChatGPT prompt, you must set the API key as an environment variable, for more info see [the docs](https://github.com/jackMort/ChatGPT.nvim).
- `<space>ca`: Perform Code Actions.

### Git

All git commands start with `<space>g`, here are the more interesting ones:

- `<space>gt`: Open a terminal with [Lazygit](https://github.com/jesseduffield/lazygit).
- `<space>ga`: Add the hunk under the cursor to changes.
- `<space>gA`: Add all changes in the file.
- `<space>gr`: Remove the hunk under the cursor from the changes.
- `<space>gb`: Show blame for the current line.

### File & Search

You can perform actions on files with `<space>f` and on buffer / history with `<space>s`, more notably:

- `<space>ff`: Search files in the current working directory by the filename.
- `<space>fr`: Search recently opened files by the filename.
- `<space>sf`: Search text inside the files in the current working directory.
- `<space>sb`: Search text inside the current buffer.

### Competitest

- `<space>tr`: Compile and run all tests.
- `<space>ta`: Add a test case.
- `<space>te`: Edit test cases.

### Repl

- `<space>rp`: Open a Python repl (opens `bpython`).
- `<space>rn`: Open a Node.js repl.
- `<space>rh`: Opens Htop.

### Neogen

You can use `<space>n` to create documentation for the current function / class / type.
