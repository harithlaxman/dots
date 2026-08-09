return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "neanias/everforest-nvim",
        name = "everforest",
        version = false,
        priority = 1000,
    },
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                themes = {
                    {
                        name = "onedark-dark",
                        colorscheme = "onedark",
                        before = [[
                            require('onedark').setup {
                                style = 'dark',
                                transparent = true,
                            }
                        ]]
                    },
                    {
                        name = "catppuccin-frappe",
                        colorscheme = "catppuccin",
                        before = [[
                            require('catppuccin').setup {
                                flavour = 'frappe',
                                transparent_background = true,
                            }
                        ]]
                    },
                    {
                        name = "everforest",
                        colorscheme = "everforest",
                        before = [[
                            require('everforest').setup {
                                transparent_background_level = 2
                            }
                        ]]
                    },
                },
                livePreview = true,
            })
        end
    }
}
