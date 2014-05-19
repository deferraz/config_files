execute pathogen#infect()


syntax on
set background=dark
"colorscheme desert
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better identation

set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing

set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set nofoldenable

function! Python()
    set expandtab
    set shiftround
    set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
    set colorcolumn=80
    autocmd FileType py set autoindent
    autocmd FileType py set smartindent
    autocmd FileType py set textwidth=79 " PEP-8 Friendly
endfunction


function! Getchar()
    let c = getchar()
    if c != 0
        let c = nr2char(c)
    endif
    return c
endfunction

function! Eatchar(pat)
    let c = Getchar()
    return (c =~ a:pat) ? '' : c
endfunction

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Settings for ctrlp
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/* 

" Powerline
set t_Co=256
" let g:Powerline_symbols = 'fancy'
set laststatus=2

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

set tags=tags;$HOME/.vim/tags/

let Tlist_Ctags_Cmd = '/usr/bin/ctags-exuberant'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>

" syntastic
" Disabling html by default
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }

autocmd BufNewFile,BufRead *.go set filetype=go

autocmd FileType python call Python()

" CFEngine 
autocmd BufNewFile,BufRead *.cf set filetype=cf3
autocmd FileType cf3 set autoindent
autocmd FileType cf3 set smartindent
autocmd FileType cf3 filetype plugin indent on
let g:EnableCFE3KeywordAbbreviations=1
