return {
    --"catppuccin/nvim",
    --name = "catppuccin",
    --priority = 1000,
    --opts = {
    --    flavour = "frappe",
    --    transparent_background = true
    --},
    --config = function(_, opts)
    --    require("catppuccin").setup(opts)
    --    vim.cmd.colorscheme("catppuccin")
    --end
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup {
            style = 'dark',
            transparent = true,
        }
        require('onedark').load()
        vim.cmd.colorscheme("onedark")
    end
}
