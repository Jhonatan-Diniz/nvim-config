return {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },
	config = function()

		vim.lsp.enable("lua_language_server")
		local capabilities = require('blink.cmp').get_lsp_capabilities()
		vim.lsp.config("lua_ls", {setup = { capabilities = capabilities}})
	end
}
