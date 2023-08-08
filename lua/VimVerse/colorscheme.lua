local colorscheme = "aurora"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme )

local ColorMyPencils = function()
  if not status_ok then
    vim.api.nvim_echo({{"colorscheme " .. colorscheme .. " Not Foun!!"}}, true, {})
    return
  end
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
