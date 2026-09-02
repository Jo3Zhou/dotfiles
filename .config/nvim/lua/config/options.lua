-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.spelllang = "en_gb"
vim.opt.spell = true
vim.opt.textwidth = 80
vim.g.snacks_animate = false

if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
	local osc52 = require("vim.ui.clipboard.osc52")
	vim.g.clipboard = {
		name = "OSC 52",
		copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
		paste = { ["+"] = osc52.paste("+"), ["*"] = osc52.paste("*") },
	}
else
	vim.g.clipboard = {
		name = "wl-clipboard",
		copy = { ["+"] = "wl-copy", ["*"] = "wl-copy --primary" },
		paste = { ["+"] = "wl-paste", ["*"] = "wl-paste --primary" },
		cache_enabled = 0,
	}
end

vim.opt.clipboard = "unnamedplus"
