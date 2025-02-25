-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })
-- Show function signature (requires LSP)
vim.keymap.set("i", "<C-p>", function()
	vim.lsp.buf.signature_help()
end, { desc = "Show function arguments/signature" })
-- Organize imports (requires LSP)
vim.keymap.set("n", "<C-0>", function()
	vim.lsp.buf.code_action({
		context = { only = { "source.organizeImports" } },
		apply = true,
	})
end, { desc = "Optimize imports" })
-- Format code (requires LSP or null-ls.nvim)
vim.keymap.set("n", "<C-A-l>", function()
	vim.lsp.buf.format({
		async = true,
	})
end, { desc = "Format code" })
-- Toggle comment with Ctrl+/
vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (current line)" })

vim.keymap.set("v", "<C-_>", function()
	-- Toggle comment for selected lines
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (selected lines)" })

vim.keymap.set('n', '<leader>cp', '<cmd>CccPick<CR>', { desc = 'Open Color Picker' })

function RunCode()
    local filetype = vim.bo.filetype
    local commands = {
        python = "python %",
        c = "gcc % -o a.out && ./a.out || echo 'Compilation failed!'",
        cpp = "g++ % -o a.out && ./a.out || echo 'Compilation failed!'",
        asm = "gcc % -nostdlib -static -o a.out && ./a.out || echo 'Compilation failed!'",
        sh = "if [ -x % ]; then ./%; else sh %; fi",
        java = "clear && mkdir -p out && javac -d out " .. vim.fn.expand('%:p') .. " && java -cp out " .. vim.fn.expand('%:t:r'),
    }

    local command = commands[filetype]
    if command then
        vim.cmd("w") -- Save file
        vim.cmd("TermExec cmd='" .. command .. "'")
    else
        print("No run command set for this filetype: " .. filetype)
    end
end

-- Key mapping to run code
vim.keymap.set("n", ")", ":lua RunCode()<CR>", { desc = "Run code based on filetype" })
vim.keymap.set("n", "<C-'>", ":lua RunCode()<CR>", { noremap = true, silent = true })

-- nvimtree toggle
vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })

-- Custom key mappings inside NvimTree
vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        local api = require("nvim-tree.api")

        vim.keymap.set("n", "l", api.node.open.edit, { buffer = true, desc = "Open File/Directory" })
        vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = true, desc = "Close Directory" })
    end
})
