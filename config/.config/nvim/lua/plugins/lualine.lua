-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'lewis6991/gitsigns.nvim' },
--   config = function()
--     local lualine = require 'lualine'
--
--
--     local diff = {
--       'diff',
--       colored = true,
--       symbols = { added = ' ', modified = ' ', removed = ' ' },
--     }
--
--     local mode = { 'mode' }
--
--     local branch = {
--       'branch',
--       icon = '',
--     }
--
--     local progress = function()
--       local current_line = vim.fn.line '.'
--       local total_lines = vim.fn.line '$'
--       local line_ratio = current_line / total_lines
--       return math.floor(line_ratio * 100) .. '%%'
--     end
--
--     lualine.setup {
--       options = {
--         icons_enabled = true,
--         theme = 'auto',
--         component_separators = { left = '', right = '' },
--         section_separators = { left = '', right = '' },
--         disabled_filetypes = { 'alpha', 'dashboard' },
--         always_divide_middle = true,
--       },
--
--       sections = {
--         lualine_a = { mode },
--         lualine_b = { branch, diff, diagnostics },
--         lualine_c = { 'filename' },
--         lualine_x = { 'filetype' },
--         lualine_y = { 'location' },
--         lualine_z = { progress },
--       },
--       extensions = { 'nvim-tree' },
--     }
--   end,
-- }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

    local colors = {
      color0 = '#092236',
      color1 = '#ff5874',
      color2 = '#c3ccdc',
      color3 = '#1c1e26',
      color6 = '#a1aab8',
      color7 = '#828697',
      color8 = '#ae81ff',
    }
    local my_lualine_theme = {
      replace = {
        a = { fg = colors.color0, bg = colors.color1, gui = 'bold' },
        b = { fg = colors.color2, bg = colors.color3 },
      },
      inactive = {
        a = { fg = colors.color6, bg = colors.color3, gui = 'bold' },
        b = { fg = colors.color6, bg = colors.color3 },
        c = { fg = colors.color6, bg = colors.color3 },
      },
      normal = {
        a = { fg = colors.color0, bg = colors.color7, gui = 'bold' },
        b = { fg = colors.color2, bg = colors.color3 },
        c = { fg = colors.color2, bg = colors.color3 },
      },
      visual = {
        a = { fg = colors.color0, bg = colors.color8, gui = 'bold' },
        b = { fg = colors.color2, bg = colors.color3 },
      },
      insert = {
        a = { fg = colors.color0, bg = colors.color2, gui = 'bold' },
        b = { fg = colors.color2, bg = colors.color3 },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        -- return ' '
        -- displays only the first character of the mode
        return ' ' .. str
      end,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      -- cond = hide_in_width,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    local branch = { 'branch', icon = { '', color = { fg = '#A6D4DE' } }, '|' }
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ' },
      colored = true,
      update_in_insert = false,
      always_visible = true,
      cond = function()
        return vim.bo.filetype ~= 'markdown'
      end,
    }

    lualine.setup {
      icons_enabled = true,
      options = {
        theme = my_lualine_theme,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '|', right = '' },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch, diagnostics },
        lualine_c = { diff, filename },
        lualine_x = {
          {
            'flutter-tools',
            cond = function ()
              return vim.bo.filetype == 'dart'
            end,
          },
          {
            -- require("noice").api.statusline.mode.get,
            -- cond = require("noice").api.statusline.mode.has,
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          -- { "encoding",},
          -- { "fileformat" },
          { 'filetype' },
        },
      },
    }
  end,
}
