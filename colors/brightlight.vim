set background=light
let g:colors_name = "brightlight"
lua package.loaded["lush_spec.brightlight"] = nil
lua require "lush"(require "lush_spec.brightlight")
