
set number
"searching...
set hlsearch
set incsearch
nnoremap <silent> <CR> :noh<CR><CR>

filetype plugin indent on

"handle long lines
set nowrap
set list
set listchars=extends:#,tab:\ \ 

"Be silent!
set visualbell
set noerrorbells

"mappings (aliases)
map Y y$

"set pastetoggle=<F2>

"set title

set undolevels=1000



func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
 setlocal nonumber
 
 "set statusline=%HI
 setlocal statusline=%{WordCount()}\ word
 
endfu

com! WP call WordProcessorMode()

function! WC()
    if &modified || !exists("b:wordcount") 
            let l:old_status = v:statusmsg  
            execute "silent normal g\<c-g>"
            let b:wordcount = str2nr(split(v:statusmsg)[11])
            let v:statusmsg = l:old_status  
            return b:wordcount
    else
            return b:wordcount
    endif
endfunction 


" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78




" My settings when editing *.txt files
" "   - automatically indent lines according to previous lines
" "   - replace tab with 8 spaces
" "   - when I hit tab key, move 2 spaces instead of 8
" "   - wrap text if I go longer than 76 columns
" "   - check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=78 spell spelllang=en_us


" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Prepend ~/.backup to backupdir so that Vim will look for that directory
" before littering the current dir with backups.
" You need to do "mkdir ~/.backup" for this to work.
 set backupdir^=~/.backup

" Also use ~/.backup for swap files. The trailing // tells Vim to
" incorporate full path into swap file names.
set dir^=~/.backup//


au BufNewFile,BufRead *.s set filetype=mips
autocmd FileType mips setlocal autoindent


syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

