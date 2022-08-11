-- 基础设置
require('basic')
require('keybindings')
require('plugins')
require('colorscheme')
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
-- 内置LSP (新增)
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
--lsp common configuration
require("lsp.common-config")
--竖线
require("plugin-config.indent-blankline")
-- require("lsp.formatter")格式化
require("lsp.null-ls")
-- 复制到windows剪贴板
require('utils.fix-yank')
