local fn = vim.fn

--- Check if k9s is available
local function is_k9s_available()
	return fn.executable("k9s") == 1
end

return {
	is_k9s_available = is_k9s_available,
}
