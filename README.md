Created a scratch pad plugin flowing a [blog tutorial](https://miguelcrespo.co/posts/how-to-write-a-neovim-plugin-in-lua/)  

The plugin creates a new buffer labelled scratch upon opening neovim.

My first plugin :)

The plugin has one method
- open : opens the scratch pad buffer

```lua
vim.keymap.set('n',"<leader>bo",require("scratch-buffer").open)

```

