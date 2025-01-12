local augroup = vim.api.nvim_create_augroup("ScratchBuffer", { clear = true })

local M = {}

local function main()
  print("Hello from our plugin")
end

M.setup =  function()
  vim.api.nvim_create_autocmd("VimEnter",
    { group = augroup, desc = "Set a fennel scratch buffer on load", once = true, callback = main })
end

local function create_buffer()
    local buf = vim.api.nvim_create_buf(true, true) -- creates empty buffer that is listed in :buffers and is temporary
    vim.api.nvim_buf_set_name(buf, "*scratch*") -- sets the name of the buffer
    vim.api.nvim_set_option_value("filetype", "lua", {buf = buf}) -- basically :set
    return buf
end

local buf = create_buffer()
vim.api.nvim_buf_set_lines(buf, 0, -1, true, {" -- Welcome to Neovim --", ""}) -- sets initial buffer content
vim.api.nvim_win_set_buf(0, buf) -- sets the buffer to be the current window
vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(buf),0}) -- sets the cursor position at the last line
return M

