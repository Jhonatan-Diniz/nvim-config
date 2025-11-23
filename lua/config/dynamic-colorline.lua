vim.opt.cursorline = true
vim.opt.guicursor = "i-a-ve:block"

-- Change the colorline in the insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern= {"*:i"},
	callback= function()	
		vim.cmd(":highlight Cursor guibg=#004028 guifg=#004028")
		vim.cmd(":highlight CursorLine guibg=#001d12 guifg=#2bfbaf")
		vim.cmd(":highlight CursorLineNr guibg=#001d12 guifg=#2bfbaf")
	end
})


vim.api.nvim_create_autocmd("ModeChanged", {
	pattern= {"i:*"},
	callback = function()
		vim.cmd(":highlight Cursor guibg=#25211f guifg=#b4bdc3")	
		vim.cmd(":highlight CursorLine guibg=#25211f guifg=#b4bdc3")
		vim.cmd(":highlight CursorLineNr guibg=#25211f guifg=#b4bdc3")
	end
})


vim.api.nvim_create_autocmd("ModeChanged", {
	pattern= {"*:[vVx16]"},
	callback = function()
		vim.cmd(":highlight Visual guibg=#001d12 guifg=#2bfbaf")

		vim.cmd(":highlight CursorLineNr guibg=#001d12 guifg=#2bfbaf")
	end
})

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern= {"[vVx16]*:*"},
	callback = function()
		vim.cmd(":highlight Visual guibg=#25211f guifg=#b4bdc3")
		vim.cmd(":highlight CursorLineNr guibg=#25211f guifg=#b4bdc3")
	end
})
