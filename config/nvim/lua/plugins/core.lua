
return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-macchiato",
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				omnisharp = { enabled = false },
			},
		},
	},
	{ "Civitasv/cmake-tools.nvim", enable = false },
    {
        "gennaro-tedesco/nvim-jqx",
        event = {"BufReadPost"},
        ft = { "json", "yaml" },
    },
}
