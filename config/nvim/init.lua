-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require("lspconfig").ruff_lsp.setup({
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {},
		},
	},
})
