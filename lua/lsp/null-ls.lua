local status, null_ls = pcall(require, 'null-ls')
if not status then
    vim.notify('没有找到 null-ls')
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = false,
    sources = {
        -- Formatting ---------------------
        --  snap install shfmt(shell)
        --formatting.shfmt,
        -- StyLua(rust)
        formatting.stylua,
        -- frontend
        formatting.prettier.with({ -- 只比默认配置少了 markdown
            filetypes = {
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
                'vue',
                'css',
                'scss',
                'less',
                'html',
                'json',
                'yaml',
                'graphql',
            },
            prefer_local = 'node_modules/.bin',
        }),
        --Python
        -- pip install black
        -- asdf reshim python
        formatting.black.with({ extra_args = { '--fast' } }),
    },
    -- 保存自动格式化
    on_attach = function(client)
        if client.server_capabilities.document_formatting then
            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        end
    end,
})
