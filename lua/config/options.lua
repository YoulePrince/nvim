-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local general = require("config.general")

if general.is_windows() then
  -- print("Configuring options for Windows")
  -- Windows 下使用 PowerShell 作为默认 shell
  if vim.fn.executable("pwsh") == 1 then
    vim.opt.shell = "pwsh -NoLogo"
    vim.opt.shellcmdflag = ""
    vim.opt.shellquote = '"'
    vim.opt.shellxquote = "`"
  end
end

if general.is_linux() then
  print("Configuring options for Linux")
end

-- 设置系统剪贴板
vim.opt.clipboard = "unnamedplus"

-- 设置自动换行
vim.opt.wrap = true
vim.opt.whichwrap:append("<,>,[,],h,l")
