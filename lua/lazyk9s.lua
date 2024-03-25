local open_floating_window = require("lazyk9s.window").open_floating_window
local is_k9s_available = require("lazyk9s.utils").is_k9s_available

LAZYK9S_BUFFER = nil
LAZYK9S_LOADED = false
vim.g.lazyk9s_opened = 0
local prev_win = -1
local win = -1
local buffer = -1

--- on_exit callback function to delete the open buffer when lazyk9s exits in a neovim terminal
local function on_exit(job_id, code, event)
	if code ~= 0 then
		return
	end

	LAZYK9S_BUFFER = nil
	LAZYK9S_LOADED = false
	vim.g.lazyk9s_opened = 0
	vim.cmd("silent! :checktime")

	if vim.api.nvim_win_is_valid(prev_win) then
		vim.api.nvim_win_close(win, true)
		vim.api.nvim_set_current_win(prev_win)
		prev_win = -1
		if vim.api.nvim_buf_is_valid(buffer) and vim.api.nvim_buf_is_loaded(buffer) then
			vim.api.nvim_buf_delete(buffer, { force = true })
		end
		buffer = -1
		win = -1
	end
end

--- Call k9s
local function exec_k9s_commmand(cmd)
	if LAZYK9S_LOADED == false then
		-- ensure that the buffer is closed on exit
		vim.g.lazyk9s_opened = 1
		vim.fn.termopen(cmd, { on_exit = on_exit })
	end
	vim.cmd("startinsert")
end

--- :LazyK9s entry point
local function lazyk9s()
	if is_k9s_available() ~= true then
		print("Please install k9s. Check documentation for more information")
		return
	end

	prev_win = vim.api.nvim_get_current_win()

	win, buffer = open_floating_window()

	local cmd = "k9s"

	exec_k9s_commmand(cmd)
end

return {
	lazyk9s = lazyk9s,
}
