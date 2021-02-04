
if exists('g:loaded_zoom')
  finish
endif
let g:loaded_zoom = 1

nnoremap <silent> <Plug>zoom-toggle :call zoom#toggle()<CR>

if !hasmapto('<Plug>zoom-toggle')
  nmap <leader>z <Plug>zoom-toggle
endif

