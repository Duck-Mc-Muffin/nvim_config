---@diagnostic disable: undefined-global`

return {
s(
    {trig = "link"},
    {
        t('['),
        d(1, get_s_selection),
        t(']('),
        i(2, vim.trim(vim.fn.getreg('+'))),
        t(')'),
    }
),

}
