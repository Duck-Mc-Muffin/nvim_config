require('typst-preview').setup(
{
    --dependencies_bin = {
    --    ['tinymist'] = 'tinymist',
    --    ['websocat'] = nil
    --},
    port = 8000,
    get_root = function (_main_file) return vim.fn.getcwd() end,
})
