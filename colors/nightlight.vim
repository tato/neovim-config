set background=dark
let g:colors_name = "nightlight"
lua package.loaded["lush_spec.nightlight"] = nil
lua require "lush"(require "lush_spec.nightlight")
