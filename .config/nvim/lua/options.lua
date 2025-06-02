require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.g.have_nerd_font = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
o.mouse = "a"

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Sync clipboard between OS and Neo
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = "yes"

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Sets how neowill display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `opt` instead of `o`.
--  It is very similar to `o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
-- o.list = true
-- opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = "split"

-- Show which line your cursor is on
o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
o.confirm = true

o.expandtab = false -- Use actual TAB characters, not spaces
o.tabstop = 4 -- A TAB counts as 4 spaces (visually)
o.shiftwidth = 4 -- Indent by 4 spaces when using >> or <<
o.softtabstop = 4 -- When pressing <Tab>, insert 1 real tab
