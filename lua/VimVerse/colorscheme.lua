local colorscheme = "lunaperche"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme )

if not status_ok then
  vim.api.nvim_echo({{"colorscheme " .. colorscheme .. " Not Foun!!"}}, true, {})
  return
end
