local ret = {}

-- 枚举函数
function ret.Enum(names, start)
  start = start or 1
  local t = {}
  local mt = {
    __index = t,
    __newindex = function()
      error("Enum is read-only", 2)
    end,
    __pairs = function()
      return next, t, nil
    end,
  }

  for i, name in ipairs(names) do
    t[name] = i + start - 1
  end

  return setmetatable({}, mt)
end

---@diagnostic disable-next-line: undefined-field
local uname = vim.loop.os_uname()

-- 检查是否是 macOS
function ret.is_macos()
  return uname.sysname == "Darwin"
end

-- 检查是否是 Linux
function ret.is_linux()
  return uname.sysname == "Linux"
end

-- 检查是否是 Windows
function ret.is_windows()
  return uname.sysname == "Windows_NT"
end

return ret
