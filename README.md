# lazyk9s.nvim

Plugin for calling [k9s](https://github.com/derailed/k9s) from within neovim.

See [akinsho/nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua#custom-terminals) or [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm) as an alternative to this package.

### Install

Install using [`vim-plug`](https://github.com/junegunn/vim-plug):

```vim
" nvim v0.7.2
Plug 'nikitathomas342/lazyk9s.nvim'
```

Install using [`packer.nvim`](https://github.com/wbthomason/packer.nvim):

```lua
-- nvim v0.7.2
use({
    "nikitathomas342/lazyk9s.nvim",
    -- optional for floating window border decoration
    requires = {
        "nvim-lua/plenary.nvim",
    },
})
```

Install using [`lazy.nvim`](https://github.com/folke/lazy.nvim):

```lua
-- nvim v0.8.0
require("lazy").setup({
    {
      "nikitathomas342/lazyk9s.nvim",
    	cmd = {
    		"LazyK9s",
    	},
      -- optional for floating window border decoration
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
    },
})
```

### Usage

Call `:LazyK9s` to start a floating window with `ks9` in the current working directory.
And set up a mapping to call `:LazyK9s`:

```vim
" setup mapping to call :LazyK9s
nnoremap <silent> <leader>lk :LazyK9s<CR>
```

# lazyk9s.nvim
