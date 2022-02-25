local colorscheme = "deus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("color scheme " .. colorscheme .. " not found!")
    return
end
