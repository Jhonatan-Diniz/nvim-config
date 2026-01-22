return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate | :TSEnable highlight",
	opts = {
		highlight = {enable = true},
	}
}
