local if_nil = vim.F.if_nil

local table_len = function (T)
  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count
end

local nvim_version = vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
local packer_opt, packer_start = require('packer.plugin_utils').list_installed_plugins()
local packer_opt_len = table_len(packer_opt)
local packer_start_len = table_len(packer_start)
local lsp_installer_len = #require('nvim-lsp-installer.servers').get_installed_server_names()
local default_header = {
  type = "text",
  --  val = {
  --    [[                               __                ]],
  --    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  --    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  --    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  --    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  --    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  --  },

  -- val = {
  --   [[              xoolllllloodx             ]],
  --   [[              ollllllllllllllox         ]],
  --   [[              olllllllllllllllllox      ]],
  --   [[              olllllllllllllllllllox    ]],
  --   [[              olllllllllllllllllllllo   ]],
  --   [[              OOOOOOOOOOOOOOxolllllllo  ]],
  --   [[                             dllllllllo ]],
  --   [[xllllllllld                  dlllllllllx]],
  --   [[ollllllllld                  dlllllllllo]],
  --   [[lllllllllld                  dllllllllll]],
  --   [[lllllllllld                  dllllllllll]],
  --   [[dllllllllld                  dllllllllld]],
  --   [[kllllllllld                  dlllllllllk]],
  --   [[Xxllllllllo0                0ollllllllx ]],
  --   [[ Xxlllllllloooooooooooooooooollllllllx  ]],
  --   [[  Xkollllllllllllllllllllllllllllllok   ]],
  --   [[    0xollllllllllllllllllllllllllox     ]],
  --   [[      Kkollllllllllllllllllllllok       ]],
  --   [[         0kxolllllllllllllloxk0         ]],
  --   [[            KOxdollllllodxOK            ]],
  -- },

  val = {
    "      .            .      " .. "    Neovim " .. nvim_version .. " on " .. vim.fn.hostname(),
    "    .,;'           :,.    ",
    "  .,;;;,,.         ccc;.  ",
    ".;c::::,,,'        ccccc: " .. "    Installed Plugins (start): " .. packer_start_len,
    ".::cc::,,,,,.      cccccc.",
    ".cccccc;;;;;;'     llllll." .. "    Installed Plugins (opt): " .. packer_opt_len,
    ".cccccc.,;;;;;;.   llllll.",
    ".cccccc  ';;;;;;'  oooooo." .. "    Installed LSP Servers: " .. lsp_installer_len,
    "'lllllc   .;;;;;;;.oooooo'",
    "'lllllc     ,::::::looooo'",
    "'llllll      .:::::lloddd'",
    ".looool       .;::coooodo.",
    "  .cool         'ccoooc.  ",
    "    .co          .:o:.    ",
    "      .           .'      ",
  },

  opts = {
    position = "center",
    hl = "Type",
    -- wrap = "overflow";
  },
}

local footer = {
  type = "text",
  val = "",
  opts = {
    position = "center",
    hl = "Number",
  },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }
  if keybind then
    keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
    local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("e", "  New file", "<cmd>ene <CR>"),
    button("SPC f f", "  Find file"),
    button("SPC f h", "  Recently opened files"),
    button("SPC f r", "  Frecency/MRU"),
    button("SPC f g", "  Find word"),
    button("SPC f m", "  Jump to bookmarks"),
    button("SPC s l", "  Open last session"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  header = default_header,
  buttons = buttons,
  footer = footer,
}

local config = {
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.buttons,
    section.footer,
  },
  opts = {
    margin = 5,
  },
}


require('alpha').setup(config)
