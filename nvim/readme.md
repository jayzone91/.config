# My NeoVim Config

Just my personal Neovim Config.

Summary:  
[✨ Features](#✨-features)  
[⚡️ Requirements](#⚡️-requirements)  
[📦 Installed Plugins](#📦-installed-plugins)  
[⌛ Install](#⌛-install)  
[🎹 Keybinds](#🎹-keybinds)

## ✨ Features

- 🔥 Transform your Neovim into a full-fledged IDE
- 💤 Easily customize and extend your config with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🚀 Blazingly fast
- 🧹 Sane default settings for options, autocmds, and keymaps
- 📦 Comes with a wealth of plugins pre-configured and ready to use

## ⚡️ Requirements

- Neovim >= **0.8.0** (needs to be build wirh **LuaJIT**)
- Git
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional but recommended)_**
- nodejs (with npm)
- a C compiler for nvim-treesitter. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- ripgrep for telescope.

## 📦 Installed Plugins

- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [dinhhuy258/git.nvim](https://github.com/dinhhuy258/git.nvim)
- [dmmulroy/tsc.nvim](https://github.com/dmmulroy/tsc.nvim)
- [f3fora/cmp-spell](https://github.com/f3fora/cmp-spell)
- [folke/flash.nvim](https://github.com/folke/flash.nvim)
- [folke/neoconf.nvim](https://github.com/folke/neoconf.nvim)
- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
- [folke/noice.nvim](https://github.com/folke/noice.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
- [folke/twilight.nvim](https://github.com/folke/twilight.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [jay-babu/mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [LiadOz/nvim-dap-repl-highlights](https://github.com/LiadOz/nvim-dap-repl-highlights)
- [linux-cultist/venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [mrjones2014/legendary.nvim](https://github.com/mrjones2014/legendary.nvim)
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [p00f/clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)
- [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth)
- [utilyre/barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [Vigemus/iron.nvim](https://github.com/Vigemus/iron.nvim)
- [Vimjas/vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

## ⌛ Install

just clone the repo and copy the nvim folder into your nvim config location.
on windows you shoud start nivm as administrator so that lazy.nvim can write into /appdata/local

## 🎹 Keybinds

General keybindings in lua/mappings

| Key                 | Function                                      | Mode       |
| ------------------- | --------------------------------------------- | ---------- |
| \<Space\>           | \<leader\>                                    | i, v, n, s |
| \<C-s\>             | Save File and return to normal mode           | i,v,n,s    |
| \<C-c\>             | Return to normal mode                         |            |
| \<C-a\>             | Select all and switch to visualmode           | n          |
| \<leader\>qq        | Quit                                          | n          |
| +                   | Increment Number                              | n          |
| -                   | Decrement Number                              | n          |
| dw                  | Delete backwards                              | n          |
| \<leader\>cs        | Clear Searchresults                           | n          |
| \<A-Up\>            | Move text up one line                         | n          |
| \<A-Down\>          | Move text down one line                       | n          |
| \<leader\>\<Up\>    | Duplicate Line upwards                        | n          |
| \<leader\><\Down\>  | Duplicate Line downwards                      | n          |
| \<esc\>             | Leave Terminal Mode                           | t          |
| \<esc\>             | Escape and clear hlsearch                     | i, n       |
| \<leader\>ss        | Split screen vertical                         | n          |
| \<C-Down\>          | Move to lower Window                          | n          |
| \<C-Up\>            | Move to upper Window                          | n          |
| \<C-Left\>          | Move to left Window                           | n          |
| \<leader\><\Left\>  | Move to left Window                           | n          |
| \<C-Right\>         | Move to right Window                          | n          |
| \<leader\>\<Right\> | Move to right Window                          | n          |
| \<leader\>sq        | Close Window                                  | n          |
| \<leader\>st        | New Tab                                       | n          |
| \<leader\>sw        | Close active tab                              | n          |
| \<Tab\>             | Next Tab                                      | n          |
| \<S-Tab\>           | Prev Tab                                      | n          |
| gD                  | Go to Declaration                             | n          |
| gd                  | Go to Definition                              | n          |
| K                   | LSP Hover                                     | n          |
| gi                  | Goto Implementation                           | n          |
| rn                  | Rename                                        | n          |
| \<leader\>ca        | Code Actions                                  | n          |
| \<leader\>ts        | Toggle German Spellchecken (en on by default) | n          |
| \<leader\>pv        | Nvim Tree Toggle                              | n          |
| \<leader\>xx        | Open Trouble                                  | n          |
| \<leader\>xw        | Open Worlkspace Diag                          | n          |
| \<leader\>xd        | open Trouble Diag                             | n          |
| \<leader\>xq        | Open Quickfix Window                          | n          |
| \<leader\>xl        | Open Loclist                                  | n          |
| gR                  | Open LSP Reference                            | n          |
| \<leader\>xt        | Open with Trouble                             | n          |
| \<leader\>ff        | Telescope Fuzzy Find Files                    | n          |
| \<leader\>fg        | Telescope Live Grep                           | n          |
| \<leader\>fo        | Telescope Recently opened Files               | n          |
| \<leader\>\<space\> | Telescope open Buffers                        | n          |
| \<leader\>fb        | Telescope Fuzzy find in current Buffer        | n          |
| \<leader\>zz        | Toggle Zen Mode                               | n          |
| \<leader\>ha        | Harpoon Mark File                             | n          |
| \<leader\>ht        | Harpoon Toggle Menu                           | n          |
| \<leader\>hn        | Harpoon Navigate to next entry                | n          |
| \<leader\>hp        | Harpoon Navigate to prev entry                | n          |
| \<leader\>hc        | Harpoon Clear all Entries                     | n          |
| \<leader\>mp        | Markdown Preview Toggle                       | n          |
| \<leader\>ls        | Open Legendary                                | n          |
| \<leader\>lk        | Search Keymaps w/ Legendary                   | n          |
| \<leader\>lc        | Search Commands w/ Legendary                  | n          |
| \<leader\>lf        | Search Functions w/ Legendary                 | n          |
| \<leader\>la        | Search Autocommands w/ Legendary              | n          |
| \<leader\>tth       | Toggle Terminal horizontal                    | n          |
| \<leader\>ttv       | Toggle Terminal vertical                      | n          |

Which-key is installed and should display a _cheatsheat_ upon keypress.
