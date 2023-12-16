-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local command_keymappings = {
  -- commit
  --- Hack Debug
  ["ToggleDebugUI"] = "<F1>",
  ["DebugStartOrContinue"] = "<F5>",
  ["DebugToggleBreakpoint"] = "<F9>",
  ["DebugStepOver"] = "<F8>",
  ["DebugStepInto"] = "<F7>",
  ["DebugStop"] = "<F2>",
  ["TriggerLastRun"] = "<leader>rr",
}

local function getKey(keybinding)
  if type(keybinding) == "string" then
    return keybinding
  else
    return keybinding.keys
  end
end

local function registerKeys()
  for command, keybinding in pairs(command_keymappings) do
    local modes = keybinding.mode or "n"
    for i = 1, #modes do
      local char = string.sub(modes, i, i)
      vim.keymap.set(char, keybinding, "<CMD>" .. command .. "<CR>", {})
    end
  end
end

registerKeys()
