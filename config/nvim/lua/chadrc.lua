-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "block",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "███████╗████████╗██╗  ██╗███████╗██████╗ ███████╗██╗   ██╗███╗   ███╗",
      "██╔════╝╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝██║   ██║████╗ ████║",
      "█████╗     ██║   ███████║█████╗  ██████╔╝█████╗  ██║   ██║██╔████╔██║",
      "██╔══╝     ██║   ██╔══██║██╔══╝  ██╔══██╗██╔══╝  ██║   ██║██║╚██╔╝██║",
      "███████╗   ██║   ██║  ██║███████╗██║  ██║███████╗╚██████╔╝██║ ╚═╝ ██╝",
      "╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝",
    },
  },
}

M.mason = {
  command = true,
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "json-lsp",

    "typescript-language-server",
    "prettier",
    "eslint_d",
    "prisma-language-server",

    "pyright",
    "flake8",
    "isort",
    "black",

    "gopls",
    "gofumpt",
    "goimports",
    "golines",
    "golangci-lint",
    "golangci-lint-langserver",

    "rust-analyzer",
    -- "rustfmt", -- installed via rustup

    "nomicfoundation-solidity-language-server", -- npm install -g @nomicfoundation/solidity-language-server
    "solhint",
  },
}

return M
