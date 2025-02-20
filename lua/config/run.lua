vim.keymap.set("n", "<C-9>", function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%")
    local cmd = ""

    -- Choose the correct command based on filetype
    if filetype == "python" then
        cmd = "python3 " .. filename
    elseif filetype == "javascript" then
        cmd = "node " .. filename
    elseif filetype == "c" or filetype == "cpp" then
        cmd = "gcc " .. filename .. " -o temp && ./temp"
    elseif filetype == "java" then
        cmd = "javac " .. filename .. " && java " .. filename:gsub("%.java$", "")
    else
        print("Unsupported filetype: " .. filetype)
        return
    end

    -- Open the floating terminal and run the command
    require("toggleterm.terminal").Terminal:new({
        cmd = cmd,
        direction = "float",
    }):toggle()
end, { desc = "Run program in floating terminal" })

