-- Declaring the Module table
local M = {}

function M.switch_source_header()
    local ext = vim.fn.expand("%:e")
    local base = vim.fn.expand("%:r")

    local target = {}

    if ext == "c" then
        targets = { base .. ".h" }
    elseif ext == "cpp" then
        targets = { base .. ".h" }
    elseif ext == "h" then
        targets = { base .. ".c", base .. ".cpp" }
    else
        vim.notify("Not a C/C++ Source or Header file!", vim.log.levels.WARN)
        return
    end

    for _, target in ipairs(targets) do
        if vim.fn.filereadable(target) == 1 then
            vim.cmd("edit " .. target)
            return
        end
    end

    vim.notify("No matching Source/Header file found!", vim.log.levels.WARN)
end

return M
