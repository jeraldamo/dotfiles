local wk = require("which-key")

vim.g.mapleader = ';'


-------------------------------------------------------------
-- Key maps
-------------------------------------------------------------

-- Normal mode
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {}) -- Switch to window left
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {}) -- Switch to window down
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {}) -- Switch to window up
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {}) -- Switch to window right
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferLineCycleNext<cr>', {}) -- Switch to right buffer tab
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferLineCyclePrev<cr>', {}) -- Switch to left buffer tab
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<cr>==', {}) -- Move current line/block down
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<cr>==', {}) -- Move current line/block up
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<cr>', {}) -- Resize with up arrow
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<cr>', {}) -- Resize with up arrow
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<cr>', {}) -- Resize with up arrow
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<cr>', {}) -- Resize with up arrow
vim.api.nvim_set_keymap('n', 'j', 'gj', {}) -- Softwrap navigation
vim.api.nvim_set_keymap('n', 'k', 'gk', {}) -- Softwrap navigation
vim.api.nvim_set_keymap('n', '<C-j>', '10j', {}) -- Fast scroll
vim.api.nvim_set_keymap('n', '<C-k>', '10k', {}) -- Fast scroll
vim.api.nvim_set_keymap('n', '<S-u>', ':redo<cr>', {}) -- Easier to remember redo

-- Insert mode
vim.api.nvim_set_keymap('i', 'jj', '<esc>', {}) -- exit insert mode without leaving home row
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {}) -- exit insert mode without leaving home row
vim.api.nvim_set_keymap('i', '<A-j>', '<esc>:m .+1<cr>==gi', {}) -- Move current line/block down
vim.api.nvim_set_keymap('i', '<A-k>', '<esc>:m .-2<cr>==gi', {}) -- Move current line/block up
vim.api.nvim_set_keymap('i', '<C-v>', '<C-o>v', {}) -- enter visual mode from insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})

-- Visual mode
vim.api.nvim_set_keymap('v', '<', '<gv', {}) -- Better indenting
vim.api.nvim_set_keymap('v', '>', '>gv', {}) -- Better indenting

-- Visual block mode
vim.api.nvim_set_keymap('x', 'K', ":move '<-2<CR>gv-gv", {}) -- Move selected line/block up
vim.api.nvim_set_keymap('x', 'J', ":move '>+1<CR>gv-gv", {}) -- Move selected line/block down

-- Terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>:ToggleTerm<cr>', {})


-------------------------------------------------------------
-- Which-key registrations
-------------------------------------------------------------

-- Normal mode
wk.register({
  [";"] = { "<cmd>Alpha<cr>", "Dashboard" },
  ["w"] = { "<cmd>w!<cr>", "Save" },
  ["q"] = { "<cmd>qa<cr>", "Quit" },
  ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise()<cr>", "Comment" },
  ["c"] = { "<cmd>Bdelete<cr>", "Close Buffer" },
  ["e"] = { "<cmd>Neotree filesystem reveal toggle dir=%:p:h<cr>", "Explorer" },
  ["t"] = { "<cmd>ToggleTerm size=20 dir=git_dir direction=horizontal<cr>", "Terminal" },
  C = {
    name = "Neovim Config",
    i = { "<cmd>e ~/.config/nvim/init.lua<cr>", "Edit init.lua"},
    r = { function()
            vim.api.nvim_command('source ~/.config/nvim/init.lua')
            require('plenary.reload').reload_module('init', true)
            require('log'):info('Reloading init.lua')
          end, "Reload init.lua"},
    s = { "<cmd>PackerSync<cr>", "PackerSync" },
  },
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, --, noremap = false, buffer = 123 }, -- additional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    ["1"] = "which_key_ignore", -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
  -- l = ,

}, { mode = "n", prefix = "<leader>", nowait = true })

wk.register({
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  -- f = { require("lvim.lsp.utils").format, "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  h = { vim.lsp.buf.hover, "Hover"},
  j = {
    vim.diagnostic.goto_next,
    "Next Diagnostic",
  },
  k = {
    vim.diagnostic.goto_prev,
    "Prev Diagnostic",
  },
  -- l = { vim.lsp.codelens.run, "CodeLens Action" },
  l = { vim.diagnostic.open_float, "Line Diagnostics" },
  g = {
    name = "Goto",
    d = { vim.lsp.buf.definition, "Definition"},
  },
  p = {
    name = "Peek",
    d = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Definition" },
    t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>", "Type Definition" },
    i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", "Implementation" },
    r = { "<cmd>lua require('goto-preview').goto_preview_references()<cr>", "References" },
  --   t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
  --   i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
  },
  q = { vim.diagnostic.setloclist, "Quickfix" },
  r = { vim.lsp.buf.rename, "Rename" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },
  e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  }, {mode = "n", prefix = "<space>", nowait = true })

-- Insert mode
wk.register({
  ["/"] = { "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" },
}, { mode = "v", prefix = "<leader>", nowait = true })
