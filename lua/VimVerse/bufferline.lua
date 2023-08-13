local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
  return
end

bufferline.setup({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    -- themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
    -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    -- close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
    -- right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    -- left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
    -- middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
    indicator = {
      --     icon = '      ', -- this should be omitted if indicator style is not 'icon'
      style = 'none' --| 'underline' | 'icon',
    },
    modified_icon = '*',
    tab_size = 23,
    always_show_bufferline = true, --| false,
    diagnostics = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    }
  },
})
