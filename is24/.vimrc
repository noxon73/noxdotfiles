" http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide


"pathogen
call pathogen#incubate()
"call pathogen#helptags()
"
execute pathogen#infect()                                                                                                         
 
 
 
" leader default key is \
map <leader>g :GundoToggle<CR>
"nnoremap <F8> ....
 
let g:syntastic_python_checkers=['pylint']
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
" supertab config
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
 
" pydiction https://github.com/rkulla/pydiction
let g:pydiction_location ='/data/home/EGrehm/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20
" pydoc
let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_window_lines=0.2
 
if has("autocmd")
        autocmd FileType python set complete+=k/data/home/egrehm/.vim/bundle/pydiction/pydiction.py  isk+=.,(
    endif " has("autocmd"
 
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
"python-syntax
let python_highlight_all = 1
"tagbar
nmap <F8> :TagbarToggle<CR>
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>t :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end modules
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99
"set textwidth=79
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autowrite  "save all buffer when CTRL-z
set background=dark
set nopaste  " paste breaks tab competion 
"set paste
set incsearch
"https://danielmiessler.com/study/vim/
inoremap jk <ESC>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>pa :set paste!<CR>
"http://stackoverflow.com/questions/1497958/how-to-use-vim-registers paste last yank(not delete)
map <leader>0 "0p<CR> 

"https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Move to the next buffer
" nmap <leader>l :bnext<CR>
"
" " Move to the previous buffer
" nmap <leader>h :bprevious<CR>
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
"close buffer on quit
nnoremap <leader>q :bd<CR>
"diff before write
nnoremap <leader>d :w !diff % -<CR>
" show registerr
noremap <leader>r :reg>

syntax on 
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" la bö
set cursorline
set cursorcolumn
set scrolloff=5

"colors & co
set t_Co=256 "before colorscheme
"colorscheme herald
"colorscheme xoria256
"colorscheme kalisi "light and dark favorit if more configurable (darker bg) 
"
"colo seoul256-light
let g:seoul256_background = 233 " darker
let g:seoul256_light_background = 253
colo seoul256
nnoremap <leader>bl :colo seoul256-light<CR>
nnoremap <leader>bd :colo seoul256<CR>
" standard
"nnoremap <leader>bl :set bg=light<CR>
"nnoremap <leader>bd :set bg=dark<CR>


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
"" Show matching brackets when text indicator is over them
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
"filetype plugin on

 
" my
" Sets how many lines of history VIM has to remember
set history=1500
set undolevels=100

if match($TERM, "screen")!=-1
          set term=xterm-256color
endif

set whichwrap+=<,>,hl
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" http://vim.wikia.com/wiki/GNU_Screen_integration
map ^[[1~ <Home>
map ^[[4~ <End>
imap ^[[1~ <Home>
imap ^[[4~ <End>


" http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
