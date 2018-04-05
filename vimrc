
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

set pastetoggle=<F2>

set title

set undolevels=1000


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


" My settings when editing *.txt files
" "   - automatically indent lines according to previous lines
" "   - replace tab with 8 spaces
" "   - when I hit tab key, move 2 spaces instead of 8
" "   - wrap text if I go longer than 76 columns
" "   - check spelling
autocmd FileType text setlocal autoindent expandtab softtabstop=2 textwidth=78 spell spelllang=en_us


" Don't do spell-checking on Vim help files
autocmd FileType help setlocal nospell

" Prepend ~/.vim/.backup to backupdir so that Vim will look for that directory
" before littering the current dir with backups.
" You need to do "mkdir ~/.vim/.backup" for this to work.
 set backupdir^=~/.vim/.backup

" Also use ~/.backup for swap files. The trailing // tells Vim to
" incorporate full path into swap file names.
set dir^=~/.backup//


" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Indent automatically depending on filetype
filetype indent on

syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

