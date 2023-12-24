-- LSP Support
return {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    opts = {
        servers = {
            dartls = {}
        }
    },
    event = 'VeryLazy',
    dependencies = {
        -- LSP Management
        -- https://github.com/williamboman/mason.nvim
        { 'williamboman/mason.nvim' },
        -- https://github.com/williamboman/mason-lspconfig.nvim
        { 'williamboman/mason-lspconfig.nvim' },

        -- Useful status updates for LSP
        -- https://github.com/j-hui/fidget.nvim
        { 'j-hui/fidget.nvim',                opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        -- https://github.com/folke/neodev.nvim
        { 'folke/neodev.nvim' },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            -- Update this list to the language servers you need installed
            ensure_installed = {
                -- "bashls", # requires npm to be installed
                -- "cssls", # requires npm to be installed
                -- "html", # requires npm to be installed
                "lua_ls",
                -- "intelephense", # requires npm to be installed
                -- "jsonls", # requires npm to be installed
                "lemminx",
                "marksman",
                "quick_lint_js",
                "pyright",
                "omnisharp"
                -- "tsserver", # requires npm to be installed
                -- "yamlls", # requires npm to be installed
            }
        })

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lsp_attach = function(client, bufnr)
            -- Create your keybindings here...
        end


        -- Call setup on each LSP server
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                })
            end
        })

        lspconfig.omnisharp.setup {}

        lspconfig.pyright.setup {
            settings = {
                python = {
                    formatting = {
                        provider = { "black", "pyink" }
                    }
                }
            }
        }
        -- lspconfig.pyright.setup {
        --   settings = {
        --     python = {
        --       formatting = {
        --         provider = "black",
        --       },
        --       diagnostics = {
        --         -- Get the language server to recognize the `vim` global
        --         globals = { 'python' },
        --       },
        --       analysis = {
        --         autoSearchPaths = true,
        --         useLibraryCodeForTypes = true,
        --       },
        --     },
        --   },

        --   cmd = { '/opt/homebrew/bin/pyright-langserver', '--stdio' }, -- Specify the command to run the language server
        --   filetypes = { "python" }
        -- }



        -- Lua LSP settings
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        }
    end
}
