function! quickhelp#open()
  let buf = nvim_create_buf(v:false, v:true)
  let text = readfile($MYVIMRCPATH.'/help.txt')
  call nvim_buf_set_lines(buf, 0, -1, v:true, text)

  let width = min([90, &columns*3/4])
  let height = min([30, &lines*3/4, len(text)])
  let col = (&columns-width)/2
  let row = (&lines-height)/2

  let opts = {'relative': 'editor', 'width': width, 'height': height, 'col': col,
      \ 'row': row, 'anchor': 'NW', 'style': 'minimal'}
  let win = nvim_open_win(buf, 0, opts)

  call win_gotoid(win)
  autocmd CursorMoved,CursorMovedI <buffer> :q!
endfunction
