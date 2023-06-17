# Renso.nvim

My awesome Neovim configuration

## Installation

To install this config just copy these files to `~/.config/nvim/` or create a symlink to this repo in the same directory. You will need a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) installed to see all the pretty icons and Node for some plugins (e.g. Copilot).

## Plugins

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) as a Plugin manager, therefore the full configuration for each plugin is in its file. The plugins are structured as follows:

<details>
<summary>Click here to see the plugin structure</summary>

```bash
plugins
├── comments
│   ├── Comment.lua
│   ├── init.lua
│   ├── neogen.lua
│   └── todo-comments.lua
├── completion
│   ├── cmp.lua
│   ├── copilot.lua
│   ├── debugprint.lua
│   ├── init.lua
│   ├── nvim-autopairs.lua
│   ├── nvim-surround.lua
│   └── template.lua
├── editor
│   ├── gitsigns.lua
│   ├── init.lua
│   ├── neo-tree.nvim
│   ├── telescope.lua
│   ├── toggleterm.lua
│   ├── trouble.lua
│   └── which-key.lua
├── lsp
│   ├── settings
│   │   ├── jdtls.lua
│   │   ├── jsonls.lua
│   │   ├── lua_ls.lua
│   │   └── rust_analyzer.lua
│   ├── format.lua
│   ├── init.lua
│   ├── keymaps.lua
│   ├── lspconfig.lua
│   └── null-ls.lua
├── ui
│   ├── barbecue.lua
│   ├── bufferline.lua
│   ├── illuminate.lua
│   ├── init.lua
│   ├── lualine.lua
│   ├── noice.lua
│   ├── notify.lua
│   └── theme.lua
├── chatgpt.lua
├── competitest.lua
├── deps_manager.lua
├── treesitter.lua
└── ufo.lua
```

</details>

<details>
<summary>Click here to see the main plugins list</summary>

- comments
  - [Comment.nvim](https://github.com/numToStr/Comment.nvim)
  - [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
  - [neogen](https://github.com/danymat/neogen)
- completion
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - [nvim-surround](https://github.com/kylechui/nvim-surround)
  - [debugprint.nvim](https://github.com/andrewferrier/debugprint.nvim)
  - [template.nvim](https://github.com/glepnir/template.nvim)
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- lsp
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - [mason.nvim](https://github.com/williamboman/mason.nvim)
  - [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  - [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
  - [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
  - [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
- editor
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
  - [which-key.nvim](https://github.com/folke/which-key.nvim)
  - [trouble.nvim](https://github.com/folke/trouble.nvim)
  - [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- ui
  - [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
  - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
  - [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
  - [nvim-notify](https://github.com/rcarriga/nvim-notify)
  - [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- misc
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim)
  - [competitest.nvim](https://github.com/xeluxee/competitest.nvim)
  - [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
  - [crates.nvim](https://github.com/Saecki/crates.nvim)
  - [package-info.nvim](https://github.com/vuki656/package-info.nvim)

</details>

## Config

In the `user` folder are present 6 configuration files:

- `autocommands.lua`: Here are present autocommands that run based on the filetype opened.
- `keymaps.lua`: Basic keymaps for basic functionalities, independent from plugins.
- `lazy_bootstrap.lua`: Copy-paste snippet for bootstrapping Lazy.nvim.
- `util.lua`: Some utils from [LazyVim](https://github.com/LazyVim/LazyVim).
- `options.lua`: Vim options.
- `settings.lua`: Centralized place for some config such as lsp servers, linters & formatters, icons.

## Keybindings

You can find out about other keybindings by starting one (most likely with `<space>`). The main commands and categories are the following:

- `<space>x`: Close current buffer.
- `<space>e`: Open and close Neotree.
- `<space>Y`: Copy the whole file to the clipboard.
- `<space>y`: Works like `y`, but copies to the clipboard.
- `<C-\>`: Open a terminal inside Neovim, use the same keybinding to close it.

### Help

Here you can find help for all commands, keymaps, options, etc. Just select what you want help with by pressing `<space>h`.

### Neotree

- `u`: Set the root directory to the parent of the current one.
- `.`: Set the root directory to the one under the cursor.

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
- `<space>cp`: Add a debug print.
- `<space>cv`: Add a debug print of the current variable.
- `<space>cd`: Deletes all debug prints in the current buffer.

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
- `<space>ft`: Search and insert a template.
- `<space>sf`: Search text inside the files in the current working directory.
- `<space>sb`: Search text inside the current buffer.

### Competitest

- `<space>tr`: Compile and run all tests.
- `<space>ta`: Add a test case.
- `<space>te`: Edit test cases.

### Repl

- `<space>rp`: Open a Python repl (opens `ipython`).
- `<space>rn`: Open a Node.js repl.
- `<space>rh`: Opens Htop.

### Neogen

You can use `<space>n` to create documentation for the current function / class / type.
