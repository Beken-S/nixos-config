local function escape(str)
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
    escape(ru_shift) .. ";" .. escape(en_shift),
    escape(ru) .. ";" .. escape(en),
}, ",")

require("langmapper").setup({
    default_layout = [[`1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./~!@#$%^&*()_+qwertyuiop{}|asdfghjkl:"zxcvbnm<>?]],
    layouts = {
        ru = {
            id = "Russian",
            layout = [[ё1234567890-=йцукенгшщзхъ\фывапролджэячсмитьбю.Ё!"№;%:?*()_+ЙЦУКЕНГШЩЗХЪ/ФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,]],
        },
    },
    os = {
        Linux = {
            get_current_layout_id = function()
                local json = vim.fn.system("niri msg --json keyboard-layouts")
                local ok, layouts = pcall(vim.json.decode, json)

                if not ok or layouts.current_idx == nil then
                    return "English (US)"
                end

                return layouts.names[layouts.current_idx + 1]
            end,
        },
    },
})
