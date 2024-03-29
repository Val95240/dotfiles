" This plugin simply toggles boolean, i.e. changes common forms of "true" in
" "false" and vice versa

if exists("g:loaded_boolean_toggle")
    finish
endif
let g:loaded_boolean_toggle = 1

let s:translate_dict = {
    \ 'true': 'false',
    \ 'false': 'true',
    \ 'True': 'False',
    \ 'False': 'True',
    \ 'TRUE': 'FALSE',
    \ 'FALSE': 'TRUE',
\ }

function! s:ToggleBoolean()
    let l:word = expand("<cword>")
    for [l:key, l:value] in items(s:translate_dict)
        if l:word ==# l:key
            execute "normal! ciw" . l:value
        endif
    endfor
    call repeat#set("\<Plug>ToggleBoolean")
endfunction

function! s:ToggleBooleanVisual()
    let l:g_flag = &gdefault ? '' : 'g'
    let l:search_pattern = join(keys(s:translate_dict), '\|')
    execute 's/\<' . l:search_pattern . '\>/\=s:translate_dict[submatch(0)]/e' . l:g_flag
endfunction


nnoremap <silent> <Plug>ToggleBoolean :call <SID>ToggleBoolean()<CR>
nmap g! <Plug>ToggleBoolean

vnoremap <silent> g! :call <SID>ToggleBooleanVisual()<CR>

