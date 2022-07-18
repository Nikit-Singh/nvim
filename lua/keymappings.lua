local keymap = vim.keymap.set
local silent = { silent = true }

-- Reload neovim
keymap('n', "<Leader><CR>", ":luafile %<CR>", silent)

-- Better window movement
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)
-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Map jj to escape visual mode
keymap("i", "jj", "<ESC>", silent)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Quickfix
keymap("n", "<Leader>,", ":cp<CR>", silent)
keymap("n", "<Leader>.", ":cn<CR>", silent)

-- Resie Splits
keymap("n", "<C-Left>", ":vertical resize +1<CR>", silent)
keymap("n", "<C-Right>", ":vertical resize -1<CR>", silent)

-- Toggle quicklist
keymap("n", "<Leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", silent)
keymap("x", "ga", "<Plug>(EasyAlign)", silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- Telescope
keymap("n", "<Leader>ff", "<CMD>lua require('plugins.telescope').project_files()<CR>")

-- Find word/file across project
keymap("n", "<Leader>fp",
  "<CMD>lua require('plugins.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>")
keymap("n", "<Leader>fw", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
keymap("v", "<Leader>fw", "<CMD>lua require('telescope.builtin').grep_string({default_text = vim.fn.expand('<cword>')})<CR>")

-- Git
keymap("n", "<Leader>fga", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", {})
keymap("n", "<Leader>fgc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":BufferClose<CR>", silent)
keymap("n", "<A-p>", ":BufferPin<CR>", silent)

keymap("n", "<A-1>", ":BufferGoto 1<CR>", silent)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", silent)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", silent)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", silent)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", silent)
keymap("n", "<A-6>", ":BufferGoto 6<CR>", silent)
keymap("n", "<A-7>", ":BufferGoto 7<CR>", silent)
keymap("n", "<A-8>", ":BufferGoto 8<CR>", silent)
keymap("n", "<A-9>", ":BufferGoto 9<CR>", silent)

-- VS Code like renaming with Spectre
keymap("n", "<Leader>ra", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
keymap("v", "<Leader>ra", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "]n", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "[n", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)

-- Harpoon
keymap("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", silent)
keymap("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", silent)
keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", silent)
keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", silent)
keymap("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", silent)
keymap("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", silent)
keymap("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", silent)
keymap("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", silent)
keymap("n", "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", silent)
keymap("n", "<leader>h6", "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", silent)
keymap("n", "<leader>h7", "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", silent)
keymap("n", "<leader>h8", "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", silent)
keymap("n", "<leader>h8", "<cmd>lua require('harpoon.ui').nav_file(9)<CR>", silent)
keymap("n", "<leader>h0", "<cmd>lua require('harpoon.ui').nav_file(10)<CR>", silent)
