-- keymaps
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.lsp.config.zls = {
    settings = {
        zls = {
            prefer_ast_check_as_child_process = true,

            inlay_hints_show_variable_type_hints = true,
            inlay_hints_show_struct_literal_field_type = true,
            inlay_hints_show_parameter_name = true,
            inlay_hints_show_builtin = true,

            semantic_tokens = "full",
        },
    },
}
