set encoding=utf-8
set number
syntax on
set nocompatible
set mouse=a
set autoindent
set smartindent  
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4
" show current edited file path
set laststatus=2
set hlsearch
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
let s:prevcountcache=[[], 0]
function! ShowCount()
    let key=[@/, b:changedtick]
    if s:prevcountcache[0]==#key
        return s:prevcountcache[1]
    endif
    let s:prevcountcache[0]=key
    let s:prevcountcache[1]=0
    let pos=getpos('.')
    try
        redir => subscount
        silent %s///gne
        redir END
        let result=matchstr(subscount, '\d\+')
        let s:prevcountcache[1]=result
        return result
    finally
        call setpos('.', pos)
    endtry
endfunction
set ruler
let &statusline='%{ShowCount()} %<%f %h%m%r%=%-14.(%l,%c%V%) %P'
