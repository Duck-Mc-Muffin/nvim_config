---@diagnostic disable: undefined-global`

return {
s(
    {trig = "clog", snippetType="autosnippet"},
    {
        t('console.log('),
        d(1, get_s_selection),
        t(');'),
        i(0);
    }
),

}
