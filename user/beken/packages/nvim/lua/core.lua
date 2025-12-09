-- Отображение номеров строк
vim.wo.number = true
vim.wo.relativenumber = true

-- Поддержка мыши
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Отступы
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Максимальная длина строки
vim.opt.colorcolumn = "80"

-- Отображение пробельных символов
vim.opt.list = true
vim.opt.listchars = {
    tab = "> ",
    trail = ".",
    nbsp = "␣",
}

-- Отображение подсказок
vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "●",
        format = function(diagnostic)
            return string.format(" %s [%s]", diagnostic.message, diagnostic.source)
        end,
    },
    signs = true,
    underline = true,
    severity_sort = true,
})

-- Перенос строк
vim.opt.wrap = false

-- Минимальное количество строк выше/ниже курсора при прокрутке
vim.opt.scrolloff = 8

-- Поддержка True Color
vim.opt.termguicolors = true

-- Копирование и вставка работают через системный буфер обмена
vim.opt.clipboard = "unnamedplus"

-- Орфография
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "ru_ru" }
vim.opt.spellsuggest = "best,9"
vim.opt.spelloptions = "camel"
