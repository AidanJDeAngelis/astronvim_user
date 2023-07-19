-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
return {
  virtual_text = false,
  underline = true,
  virtual_lines = {
    only_current_line = true,
  },
  update_in_insert = false,
  severity_sort = true,
}
