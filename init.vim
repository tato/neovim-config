"    
"    VIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIM
"     ᕙ(⇀‸↼‶)ᕗ
"   


silent! language en_US
silent! language en_US.utf-8
" Plugins {{{

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'qpkorr/vim-bufkill'
Plug 'tommcdo/vim-lion'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
augroup git_gutter_config
  autocmd!
  au VimEnter * GitGutterSignsDisable 
  au VimEnter * GitGutterLineHighlightsDisable
  au VimEnter * GitGutterLineNrHighlightsEnable
  au VimEnter * highlight GitGutterAddLineNr guifg=lightgreen
  au VimEnter * highlight GitGutterChangeLineNr guifg=lightblue
  au VimEnter * highlight GitGutterDeleteLineNr guifg=lightred
  au VimEnter * highlight GitGutterChangeDeleteLine guifg=lightred
augroup END

Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <Space><Space> :GFiles<CR>

Plug 'sainnhe/sonokai'

let g:nuake_per_tab = 1
Plug 'Lenovsky/nuake'
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

call plug#end()

" @TODO que tenga manera de poner ; despues de struct
" @TODO think about this: en general creo que está bien, pero va a haber
"       que configurarle unas cuantas opciones
"packadd! auto-pairs
" @TODO no quiero que abra parentesis si estoy pegado a un texto
" }}}

" VIM Options {{{
filetype plugin indent on
syntax on

set clipboard+=unnamedplus
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set nofoldenable foldmethod=indent foldlevelstart=10 foldnestmax=10
set ignorecase smartcase inccommand=nosplit gdefault
set modeline modelines=1
set timeoutlen=1000 ttimeoutlen=0
set scrolloff=5
set hidden undofile

set updatetime=100
set title cursorline number relativenumber lazyredraw showmatch
set wrap linebreak display=truncate
set noerrorbells visualbell t_vb=
" }}}

if has('termguicolors')
    set termguicolors
endif
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

cnoreabbrev H vert bo help

nnoremap <silent> <C-h> :call windows#move('h')<CR>
nnoremap <silent> <C-j> :call windows#move('j')<CR>
nnoremap <silent> <C-k> :call windows#move('k')<CR>
nnoremap <silent> <C-l> :call windows#move('l')<CR>

nnoremap <silent> <F2> :call quickhelp#open()<CR>

" Misc Keyboard Shortcuts {{{

nnoremap ; :
vnoremap ; :

inoremap jk <ESC>
inoremap Jk <ESC>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" gj gk -> Join/Break Lines
nnoremap gj J
vnoremap gj J
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
nnoremap gk :<C-u>call BreakHere()<CR>

" Ctrl-S -> Save Files
nnoremap <C-s> :wa<CR>

"Y copies to end of line, instead of being a copy of yy
map Y y$

"Highlight last inserted text
nnoremap gV `[v`]
"@TODO onoremap gV `[v`]

nnoremap ) %
vnoremap ) %


"Disable Ex Mode, Disable help for word under cursor
"Disable default mapping for joining lines
nnoremap Q <NOP>
nnoremap K <NOP>
vnoremap K <NOP>
nnoremap J <NOP>
vnoremap J <NOP>

",h -> Disable Last Search Highlight
if maparg('<Space>l', 'n') ==# ''
  nnoremap <silent> <Space>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"gb -> Buffer navigation
nnoremap gb :ls<CR>:buffer<Space>
nnoremap ,b :buffer *

",fed ,fsd -> Configuration Management
" ,fed -> File Edit Dotfile
" ,fsd -> File Source Dotfile
nnoremap ,fed :e $MYVIMRC<CR>
nnoremap ,fsd :source $MYVIMRC<CR> | nohlsearch | call startup#maximize()

" }}}
" Comment/Uncomment Lines {{{
" TODO better
" -- Comment a line of code with ',cc', uncomment with ',cu'
"https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
augroup filetype_comments
    autocmd!
    au FileType c,cpp,java       let b:comment_leader = '// '
    au FileType rust             let b:comment_leader = '// '
    au FileType sh,ruby,python   let b:comment_leader = '# '
    au FileType conf,fstab       let b:comment_leader = '# '
    au FileType gdscript         let b:comment_leader = '# '
    au FileType vim              let b:comment_leader = '" '
    au FileType haskell          let b:comment_leader = '-- '
    au FileType dosbatch         let b:comment_leader = ':: '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" }}}
" Brackets Autoexpansion {{{

" see packadd! auto-pairs
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {;    {<CR>};<Esc>O
inoremap {,    {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [;    [<CR>];<Esc>O
inoremap [,    [<CR>],<Esc>O
" }}}

" @TODO Mode-Aware Cursors {{{
" https://github.com/blaenk/dots/blob/9843177fa6155e843eb9e84225f458cd0205c969/vim/vimrc.ln#L49-L64
"set guicursor=a:block
"set guicursor+=o:hor50-Cursor
"set guicursor+=n:Cursor
"set guicursor+=i-ci-sm:ver25-InsertCursor
"set guicursor+=r-cr:ReplaceCursor-hor20
"set guicursor+=c:Cursor
"set guicursor+=v-ve:VisualCursor
"set guicursor+=a:blinkon0
""set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
"hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16
"hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#b1d631
"hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#ff6a6a
"hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#90b0d1

" }}}

" Strip Trailing Whitespace {{{
" https://github.com/thirtythreeforty/lessspace.vim
" function StripTrailingWhitespace()
"     if !&binary && &filetype != 'diff'
"         normal mz
"         normal Hmy
"         keeppatterns %s/\s\+$//e
"         normal 'yz<CR>
"         normal `z
"     endif
" endfunction
" augroup remove_trailing_spaces_and_retab
"     autocmd!
"     au BufWrite * call StripTrailingWhitespace() | %retab!
" augroup END
" }}}

" @TODO Search in Project {{{
command! -nargs=+ -complete=file_in_path -bar Grep silent! grep! <args> | redraw!

nnoremap <silent> ,G :Grep <C-r><C-w><CR>
xnoremap <silent> ,G :<C-u>let cmd = "Grep " . visual#GetSelection() <bar>
                        \ call histadd("cmd", cmd) <bar>
                        \ execute cmd<CR>

" @TODO Filenames,Mappings,Etc
function! SearchFunction()
    let query = input("Search query: ")
    if !empty(query)
        execute 'silent grep' query | copen
    endif
    redraw!
endfunction

if executable("ag")
    set grepprg=ag\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

" }}}
" @TODO Word Completion {{{
"@TODO: Research ':help omnifunc' ':help complete-functions'
inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",,"<CR>
inoremap ,; <C-n><C-r>=pumvisible()      ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",;"<CR>
inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",:"<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",="<CR>
" }}}

" @TODO Edit recorded macro {{{
" @TODO currently only works on q register, generalize to any register
" podria preguntar esto en reddit
nnoremap Q :let<Space>@q=''<Left><C-R><C-R>q
" }}}


" List Commands {{{
" https://gist.github.com/romainl/047aca21e338df7ccf771f96858edb86
" make list-like commands more intuitive
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
    elseif cmdline =~ '\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()
" }}}
" Custom Text Objects {{{
" https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20

" 24 simple text-objects
" ----------------------
" i_ i. i: i, i; i| i/ i\ i* i+ i- i#
" a_ a. a: a, a; a| a/ a\ a* a+ a- a#
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" line text-objects
" -----------------
" il al
xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o0
onoremap al :normal val<CR>

" number text-objects (integer and float)
" ---------------------------------------
" in an
function! VisualNumber()
    call search('\d\([^0-9\.]\|$\)', 'cW')
    normal v
    call search('\(^\|[^0-9\.]\d\)', 'becW')
endfunction
xnoremap in :<C-u>call VisualNumber()<CR>
onoremap in :normal vin<CR>

" buffer text-objects
" -------------------
" i% a%
xnoremap i% :<C-u>let z = @/\|1;/^./kz<CR>G??<CR>:let @/ = z<CR>V'z
onoremap i% :normal vi%<CR>
xnoremap a% GoggV
onoremap a% :normal va%<CR>

" comment text-objects
" --------------------
" i? a?
xnoremap <buffer> i? ?/\*<CR>o/\*\/<CR>
onoremap <buffer> i? :normal vi?<CR>
" }}}
" @TODO Scratch buffer {{{
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
" }}}
" @TODO Automatic quickfix window {{{
"
"augroup auto_quickfix_window
"    autocmd!
"    au QuickFixCmdPost [^l]* cwindow
"    au QuickFixCmdPost    l* lwindow
"    au VimEnter            * cwindow
"augroup END
"
" }}}
" @TODO Symbol based navigation {{{
"@TODO: THIS NEEDS THE TAGS FILE THAT I HAVE TALKED ABOUT SOMEWHERE ABOVE
"       DO A / SEARCH FOR 'tags' OR 'ctags'
"       EVEN BETTER, THE AUTHOR EXPLAINING THIS STUFF
"       https://gist.github.com/romainl/3c7ee68125f822ec550c
"nnoremap ,j :tjump /
"nnoremap ,p :ptjump /
"nnoremap ,d :dlist /
"nnoremap [D [D:djump   <C-r><C-w><S-Left><Left>
"nnoremap ]D ]D:djump   <C-r><C-w><S-Left><Left>
"
"nnoremap ,i :ilist /
"nnoremap [I [I:ijump   <C-r><C-w><S-Left><Left><Left>
"nnoremap ]I ]I:ijump   <C-r><C-w><S-Left><Left><Left>

" }}}

" @TODO Custom C/C++ Highlighting {{{
augroup custom_c_highlighting
    autocmd!
    au FileType c,cpp syn keyword cType int8 int16 int32 int64
    au FileType c,cpp syn keyword cType uint8 uint16 uint32 uint64
    au FileType c,cpp syn keyword cType real32 real64 bool32
    au FileType c,cpp syn keyword cType i8 i16 i32 i64 u8 u16 u32 u64 f32 f64
    au FileType c,cpp syn keyword cType v2 v2i v3 v3i v4 v4i m4
    au FileType c,cpp syn keyword cStorageClass local_persist global_variable internal
augroup END
" }}}
" @TODO Wacky Compilation {{{

nnoremap <F9> :make!<CR><CR>:call OpenCompilationResult()<CR><CR>
nnoremap <F10> :cprevious<CR>
nnoremap <F11> :cnext<CR>

function! OpenCompilationResult()
    let l:window_count = winnr('$')

    if l:window_count == 1
        vnew
    elseif l:window_count == 2
        wincmd w
        enew
    else
        while winnr('$') != 2
            quit
        endwhile
        enew
    endif

    set buftype=quickfix
    copen
    wincmd w
endfunction

" augroup windows_c_compilation
"     autocmd!
"     au FileType c set makeprg=build.bat
"     au FileType c set errorformat =%f(%l):\ error\ %t%n:\ %m
"     au FileType c set errorformat^=%f(%l):\ warning\ %t%n:\ %m
"     au FileType c set errorformat^=%f(%l):\ note\ %t%n:\ %m
"     au FileType c set errorformat^=%f
" augroup END

set makeprg=build.bat
set errorformat =%f(%l):\ error\ %t%n:\ %m
set errorformat^=%f(%l):\ warning\ %t%n:\ %m
set errorformat^=%f(%l):\ note\ %t%n:\ %m
" set errorformat^=%f

" augroup make_output
"     autocmd!
"     au QuickFixCmdPost * :cw<CR>
"     "@TODO, Open in one of the two vertical buffers
"     "@TODO, Make it exclusive to :make? Still gotta mess with :grep
" augroup END

" }}}

" Language Servers {{{
lua require('lsp')

" TODO https://github.com/nanotee/nvim-lua-guide
if has('win32')
  let s:path_separator = ';'
else
  let s:path_separator = ':'
endif
let $MYVIMRCPATH=fnamemodify($MYVIMRC, ':h')
let $PATH=$PATH.s:path_separator.$MYVIMRCPATH.'/bin'

" }}}

" @TODO
nnoremap <C-R> :%s/

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
augroup last_position_jump
    autocmd!
    au BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END


" TODO: What does this do?
set wildcharm=<C-z>
cnoremap <expr> <Tab>   getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<C-t>" : "<S-Tab>"


"
" IDEAAAAAAAAAAAAAAAAAAAAAAAAAAS
"
"   - Available lowercase key pairs in normal mode
"     https://gist.github.com/romainl/1f93db9dc976ba851bbb
"
"   - Redirecting output of a command to a scratch buffer
"     https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7
"
"   - ':help gq' ':help gw' Formatting stuff
"
"   - Links
"         https://www.vi-improved.org/recommendations/
"         https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/dr2mgin/?st=jo60w1lj&sh=8a86e9d8
"         https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/dr2d3aj/?st=jo6111ur&sh=2feb16ec
"         https://gist.github.com/romainl/ce55ce6fdc1659c5fbc0f4224fd6ad29
"         https://www.reddit.com/r/vim/comments/7iy03o/you_aint_gonna_need_it_your_replacement_for/dr2d6bd/?st=jo610csh&sh=4e4fe1dd
"         https://github.com/tpope/vim-sleuth
"         https://github.com/tommcdo/vim-lion
"
"     TODO https://github.com/voldikss/vim-floaterm
"     TODO https://old.reddit.com/r/vim/comments/ey4mlp/thanks_to_bram_and_lacygoill_fzf_now_works/
"

" vim:foldenable:foldmethod=marker:foldlevel=0
