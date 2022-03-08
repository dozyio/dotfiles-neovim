" Go / Hugo Templates
function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl
        autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab
    endif
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END
