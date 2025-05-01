local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'pyright', 'bashls', 'dockerls', 'lua_ls', 'vimls'},
    handlers = {
        lsp_zero.default_setup,
    },
})


-- Import the lspconfig module
local lspconfig = require('lspconfig')

-- Define the settings for Pyright
local pyright_settings = {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'basic',
                diagnosticSeverityOverrides = {
                    reportPrivateImportUsage = 'none',
                },
            },
        },
    },
}

-- Set up Pyright with the custom settings
lspconfig.pyright.setup(pyright_settings)
