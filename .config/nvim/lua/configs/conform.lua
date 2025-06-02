local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "ruff" },
    c = { "clang-format" },
  },

  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end
  end,
}

return options
