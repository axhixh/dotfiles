local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    ensure_installed = "maintained",
    sync_install = false,
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
}
