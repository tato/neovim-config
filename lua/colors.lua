
"https://en.wikipedia.org/wiki/CIELAB_color_space#From_CIEXYZ_to_CIELAB
"https://www.mathworks.com/help/images/ref/rgb2lab.html

local M = {}

local _colors = {}

function M.get_color(color)
    return _colors[color]
end

local function rgb2lab(rgb)
    local linear = {}
    for i, c in ipairs(rgb) do
        if c <= 0.04045 then
            linear[i] = c / 12.92
        else
            linear[i] = math.pow((c + 0.055) / 1.055, 2.4)
        end
    end

    --[x   [ 0.4124 0.3576 0.1805     [r
    -- y =   0.2126 0.7152 0.0722   *  g
    -- z]    0.0193 0.1192 0.9505 ]    b]

    -- f(t)
    --   local d = 6/29
    --   if t > math.pow(d,3) then
    --     cubic_root(t)
    --   else
    --     t/(3*math.pow(d,2)) + 4/29
    --   end
    -- end

    -- local xn = 95.0489
    -- local yn = 100
    -- local zn = 108.8840

    -- L* = 116 * f(y/yn) - 16
    -- a* = 500 * (f(x/xn) - f(y/yn))
    -- b* = 200 * (f(y/yn) - f(z/zn))

end

local function rgb2hsl(rgb)
    local r = rgb[1] / 255
    local g = rgb[2] / 255
    local b = rgb[3] / 255

    local cmin = math.min(r, g, b)
    local cmax = math.max(r, g, b)
    local delta = cmax - cmin

    local h = 0
    local s = 0
    local l = 0

    if delta == 0 then
        h = 0
    elseif cmax == r then
        h = ((g - b) / delta) % 6
    elseif cmax == g then
        h = (b - r) / delta + 2
    elseif cmax == g then
        h = (r - g) / delta + 4
    end

    h = math.floor(h * 60 + 0.5)

    if h < 0 then
        h = h + 360
    end

    l = (cmax + cmin) / 2

    if delta == 0 then
        s = 0
    else
        s = delta / (1 - math.abs(2 * l - 1))
    end

    s = (s * 100)
    l = (l * 100)

    return { h, s, l }
end

function M.generate_colors_for_colorscheme()
    local colors_set = {}
    for i = 0, 1000 do -- 1000 is extremely arbitrary
        colors_set[vim.fn.synIDattr(i, "fg", "gui")] = true
        colors_set[vim.fn.synIDattr(i, "bg", "gui")] = true
    end

    local hex = "[%dabcdef]"
    local rgb_pattern = "#("..hex..hex..")("..hex..hex..")("..hex..hex..")"

    local index = 1
    local colors_rgb = {}
    for k, _ in pairs(colors_set) do
        if k ~= "" then
            r, g, b = string.match(k, rgb_pattern)
            if r and b and b then
                colors_rgb[index] = { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
                index = index + 1
            end
        end
    end

    local colors_hsl = {}
    for i, rgb in ipairs(colors_rgb) do
        colors_hsl[i] = rgb2hsl(rgb)
    end

    _colors.red = {200,100,100}
    _colors.orange = {0,100,100}
    _colors.yellow = {0,100,100}
    _colors.green = {0,100,100}
    _colors.cyan = {0,100,100}
    _colors.blue = {0,100,100}
    _colors.purple = {0,100,100}
    _colors.pink = {0,100,100}

    local smallest_l = {0,0,100}
    local biggest_l = {0,0,0}

    for i, hsl in ipairs(colors_hsl) do
        if hsl[3] < smallest_l[3] then
            smallest_l = hsl
        end
        if hsl[3] > biggest_l[3] then
            biggest_l = hsl
        end
    end

    local hue_ranges = {
        orange = {20,40},
        yellow = {40,65},
        green = {65,140},
        cyan = {140,200},
        blue = {200,255},
        purple = {255,280},
        pink = {280,340}
    }

    local classified_colors = {red={}}
    for name, _ in pairs(hue_ranges) do
        classified_colors[name] = {}
    end
    for _, hsl in ipairs(colors_hsl) do
        local found_name = "red"
        for name, range in pairs(hue_ranges) do
            if hsl[1] > range[1] and hsl[1] <= range[2] then
                found_name = name
                break
            end
        end
        local l = #classified_colors[found_name] + 1
        classified_colors[found_name][l] = hsl
    end

    local distance = function(a, b)
        local al = math.sqrt(a[1] * a[1] + a[2] * a[2] + a[3] * a[3])
        local bl = math.sqrt(b[1] * b[1] + b[2] * b[2] + b[3] * b[3])
        return math.abs(al - bl)
    end

    local perfect_comparisons = {
        red = {0,100,50},
        orange = {30,100,50},
        yellow = {50,100,50},
        green = {110,100,50},
        cyan = {175,100,50},
        blue = {230,100,50},
        purple = {270,100,50},
        pink = {310,100,50}
    }

    for name, colors in pairs(classified_colors) do
        table.sort(colors, function(a, b)
            local pf = perfect_comparisons[name]
            return distance(a, pf) < distance(b, pf)
        end)
    end

    local function dump(o)
       if type(o) == 'table' then
          local s = '{ '
          for k,v in pairs(o) do
             -- if type(k) ~= 'number' then k = '"'..k..'"' end
             s = s .. '"'..k..'": ' .. dump(v) .. ','
          end
          return s .. '} '
       else
          return tostring(o)
       end
    end

    _colors.black = smallest_l
    _colors.white = biggest_l
    -- local colors_str = {}
    -- for i, hsl in ipairs(colors_hsl) do
    --     colors_str[i] = "(h="..hsl[1]..", s="..hsl[2]..", l="..hsl[3]..")"
    -- end

    vim.fn.writefile(vim.fn.split(dump(classified_colors), "\n", 1), 'C:/code/output.txt', 'b')
    --vim.cmd("echom '"..dump(classified_colors).."'")
end

vim.cmd([[
    augroup supok_colors
        autocmd!
        au ColorScheme * lua require("colors").generate_colors_for_colorscheme()
    augroup END
]])
M.generate_colors_for_colorscheme()

return M
