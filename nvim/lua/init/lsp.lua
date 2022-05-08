local lspconfig = require('lspconfig')
local log = require('log')

local lsp_opts = {
  ["pyright"] = {},
  ["rust_analyzer"] = {},
  ["sumneko_lua"] = {},
  ["ltex"] = {},
}

for lsp, opt in pairs(lsp_opts) do
  if lspconfig[lsp] ~= nil then
    lspconfig[lsp].setup(opt)
  else
    log:warn("LanguageServer " .. lsp .. " is not installed...")
  end
end
