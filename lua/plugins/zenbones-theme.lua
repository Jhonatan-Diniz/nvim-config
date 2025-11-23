return {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    -- you can set set configuration options here
    config = function()
    	vim.g.zenbones_darken_comments = 45
		-- vim.cmd.colorscheme("duckbones")
		vim.api.nvim_set_hl(0, "Normal", { bg="none"})
		vim.api.nvim_set_hl(0, "NormalNC", { bg="none"})
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg="none"})
	  	vim.api.nvim_set_hl(0, "StatusLine", {bg = "None"})
  		vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })
    end
}
