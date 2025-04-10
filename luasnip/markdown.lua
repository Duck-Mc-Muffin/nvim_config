---@diagnostic disable: undefined-global`

return {
s(
    {trig = "link", name = 'My MD-Link', desc = 'Selected text to link in "+ register'},
    {
        t('['),
        d(1, get_s_selection),
        t(']('),
        i(2, vim.trim(vim.fn.getreg('+'))),
        t(')'),
    }
),

}
