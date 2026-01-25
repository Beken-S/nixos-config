local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.config("markdown_oxide", {
    capabilities = vim.tbl_deep_extend("force", capabilities, {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    }),
})

vim.lsp.enable("markdown_oxide")
