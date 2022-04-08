local module = {}

local coderunner_commands = {
  python = {
    r = {"<cmd>update<cr><cmd>TermExec cmd='python %'<cr>", "Run"},
    d = {"<cmd>update<cr><cmd>sp term://python -m pdb %<cr>", "Debug"},
  },
  rust = {
    r = {"<cmd>update<cr><cmd>exec '!cargo run'<cr>", "Run"},
    b = {"<cmd>update<cr><cmd>exec '!cargo build'<cr>", "Build"},
  },
}

function module.update()

  lvim.builtin.which_key.mappings["r"] = {name = "Coderunner"}

  if (coderunner_commands[vim.bo.filetype] ~= nil) then
    for key,value in pairs(coderunner_commands[vim.bo.filetype]) do
      lvim.builtin.which_key.mappings["r"][key] = value
    end
  end

  require("which-key").register(lvim.builtin.which_key.mappings, lvim.builtin.which_key.opts)
end
return module

