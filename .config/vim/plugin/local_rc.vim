" This plugin allows the user to define a folder-wise configuration vimrc that
" is kept in a hidden folder, by default in $XDG_STATE_HOME/vim/local_rc/

if exists("g:loaded_local_rc")
    finish
endif
let g:loaded_local_rc = 1

if !exists('g:local_rc_dir')
    let g:local_rc_dir = $XDG_STATE_HOME . "/vim/local_rc/"
endif

if !isdirectory(g:local_rc_dir)
    call mkdir(g:local_rc_dir, 'p')
endif

let s:sep = (has("win32") || has("win64")) ? '\' : '/'

function s:GetLocalRcPath()
    let l:list_files = globpath(g:local_rc_dir, '*', 0, 1)
    call map(l:list_files, {_, val -> val[strridx(val, s:sep)+1:]})
    call sort(l:list_files, {a, b -> strlen(a) < strlen(b)})
    let l:curr_file = substitute(expand("%:p:h"), s:sep, '%', 'g')
    let l:curr_file = substitute(l:curr_file, ':', '%', 'g')  " Remove drive separator on Windows

    for l:file in l:list_files
        if l:curr_file =~ '^' . l:file
            return g:local_rc_dir . l:file
        endif
    endfor

    return ""
endfunction

function s:LocalRcSetup()
    for l:win_id in win_findbuf(s:caller_bufnr)
        call win_execute(l:win_id, "call s:SourceLocalRc(1)")
    endfor
endfunction

function s:EditLocalRcFile()
    let l:local_rc_path = s:GetLocalRcPath()

    if empty(l:local_rc_path)
        if confirm("Save local rc file for directory " . getcwd() . " ?", "&Yes\n&No") == 2
            echom "Aborted"
            return 0
        endif
        let l:local_rc_file = substitute(getcwd(), s:sep, '\\\%', 'g')
        let l:local_rc_file = g:local_rc_dir . substitute(l:local_rc_file,  ':', '\\\%', 'g')
    else
        let l:local_rc_file = substitute(l:local_rc_path, '%', '\\%', 'g')
    endif

    let s:caller_bufnr = bufnr()
    execute "vsplit +set\\ ft=vim|autocmd\\ BufWritePost\\ <buffer>\\ call\\ <SID>LocalRcSetup() " . l:local_rc_file
endfunction

function s:SourceLocalRc(override)
    if !a:override && exists("b:local_rc_file_loaded") | return | endif

    let l:raw_local_rc_file = s:GetLocalRcPath()
    let l:local_rc_file = substitute(l:raw_local_rc_file, '%', '\\%', 'g')

    if !empty(l:local_rc_file)
        execute "source " . l:local_rc_file
    endif

    let b:local_rc_file_loaded = 1
endfunction

function s:DeleteLocalRcFile()
    let l:local_rc = s:GetLocalRcPath()
    if empty(l:local_rc) | echom "No local rc file" | return | endif

    call delete(l:local_rc)
    echom "Local rc file (" . l:local_rc . ") removed"
endfunction

function s:CleanLocalRcFiles()
    " Remove local_rc files when the corresponding directory
    " does not exist anymore
    let l:list_files = globpath(g:local_rc_dir, '*', 0, 1)
    let l:count = 0
    for l:file in l:list_files
        let l:rel_file = fnamemodify(l:file, ":t")
        let l:dir = substitute(l:rel_file, '%%', ':/', 'g')  " Drive separator on Windows
        let l:dir = substitute(l:dir, '%', '/', 'g')
        if !isdirectory(l:dir)
            call delete(l:file)
            let l:count += 1
        endif
    endfor
    redraw!

    if l:count
        echom l:count . " file" . (l:count > 1 ? 's' : '') . " removed"
    else
        echom "No file to remove"
    endif
endfunction

augroup setLocalRc
    autocmd!

    autocmd BufNewFile,BufRead * call <SID>SourceLocalRc(0)
augroup END


command! -bar LocalRcEdit call <SID>EditLocalRcFile()
command! -bar LocalRcReload call <SID>SourceLocalRc(1)
command! -bar LocalRcDelete call <SID>DeleteLocalRcFile()
command! -bar LocalRcClean call <SID>CleanLocalRcFiles()
