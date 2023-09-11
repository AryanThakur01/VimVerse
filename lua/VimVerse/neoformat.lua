-- autocmd BufWritePre * undojoin | Neoformat
vim.cmd [[
  augroup fmt
      autocmd!
      autocmd BufWritePre * Neoformat
    augroup END
]]

vim.g.neoformat_try_node_exe = 1
