-- Theme/Colorscheme
return {
    'rose-pine/neovim',
    lazy = false,    -- We want the colorscheme to load immediately when starting Neovim
    priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
    opts = {

        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = 'auto',
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = 'main',
        bold_vert_split = true,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = false,
        disable_italics = true,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = 'base',
            background_nc = '_experimental_nc',
            panel = 'surface',
            panel_nc = 'base',
            border = 'highlight_med',
            comment = 'muted',
            link = 'iris',
            punctuation = 'subtle',

            error = 'love',
            hint = 'iris',
            info = 'foam',
            warn = 'gold',

            headings = {
                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            }
            -- or set all headings at once
            -- headings = 'subtle'
        },

        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
            ColorColumn = { bg = 'rose' },

            -- Blend colours against the "base" background
            CursorLine = { bg = 'foam', blend = 10 },
            StatusLine = { fg = 'love', bg = 'love', blend = 10 },

            -- By default each group adds to the existing config.
            -- If you only want to set what is written in this config exactly,
            -- you can set the inherit option:
            Search = { bg = 'gold', inherit = false },
        }
    },
    config = function(_, opts)
        require('rose-pine').setup(opts) -- Replace this with your favorite colorscheme
        vim.cmd('colorscheme rose-pine') -- Replace this with your favorite colorscheme
        -- Colorscheme overrides
        vim.cmd([[
      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
    ]])
    end
}
