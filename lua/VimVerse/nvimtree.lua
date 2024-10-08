-- empty setup using defaults
local status_ok, nvim_tree = pcall(require,"nvim-tree")
if not status_ok then
  print("nvim-tree Not Working")
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])

-- OR setup with some options
nvim_tree.setup({
  sort_by = "case_sensitive",
  disable_netrw = false,
  respect_buf_cwd = false,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },

  tab = {
    sync = {
      open = false,
      close = true,
      ignore = {},
    },
  },
})
