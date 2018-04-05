
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



let mapleader = ","


" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

" Optional
Plug 'vim-airline/vim-airline-themes'

" Browse the file system
Plug 'scrooloose/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()

" For Airline plugin
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename


" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
" enter file search mode
nmap <leader>p :CtrlP<cr>  

" Nerdtree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open and close file tree
nmap <leader>f :NERDTreeToggle<CR>
" open current buffer in file tree
nmap <leader>n :NERDTreeFind<CR>

" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>





" ----------- Window Navigation --------------
" Use arrow keys to navigate window splits
nnoremap <silent> <Right> :wincmd l <CR>
nnoremap <silent> <Left> :wincmd h <CR>
noremap <silent> <Up> :wincmd k <CR>
noremap <silent> <Down> :wincmd j <CR>
