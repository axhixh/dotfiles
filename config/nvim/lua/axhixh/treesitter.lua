local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    ensure_installed = { "c", "lua", "kotlin", "ruby", "zig" },
    sync_install = false,
    auto_install = true,
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
