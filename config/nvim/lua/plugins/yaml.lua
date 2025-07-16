return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				yamlls = {
					settings = {
						yaml = {
							schemas = require("schemastore").yaml.schemas({
								extra = {
									{
										description = "My custom JSON schema",
										fileMatch = "**/url_fetcher/configs/*config.yml",
										name = "url_fetcher.config.yml",
										url = "url_fetcher/schema/config.yml.json",
									},
								},
							}),
						},
					},
				},
			},
		},
	},
}
