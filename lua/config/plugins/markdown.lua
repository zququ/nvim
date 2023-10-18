return {
	{
		"instant-markdown/vim-instant-markdown",
		ft = { "markdown" },
		build = "yarn install",
		config = function()
			vim.g.instant_markdown_slow = 0
			vim.g.instant_markdown_open_to_the_world = 1
			vim.g.instant_markdown_allow_unsafe_content = 1
			vim.g.instant_markdown_allow_external_content = 1
			vim.g.instant_markdown_autostart = 0
			vim.g.instant_markdown_mathjax = 1
			vim.g.instant_markdown_mermaid = 1
		end,
	},
}
