-- Add GNU linux tools from GIT_INSTALL_ROOT
local git_root = os.getenv("GIT_INSTALL_ROOT")
if git_root ~= nil then
  os.setenv("PATH", os.getenv("PATH") .. ";" .. git_root .. "\\usr\\bin")
else
  clink.print("\x1b[31mClink custom init script error: could not find GIT_INSTALL_ROOT env\x1b[m")
end

os.setenv("EDITOR", "nvim")

-- Customize Prompt
load(io.popen('starship init cmd'):read("*a"))()

