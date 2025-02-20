return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,
            view = {
                mappings = {
                    custom_only = false, -- Ensures default mappings exist
                    list = {} -- We move keybindings to `keymaps.lua`
                }
            }
        })
    end
}

