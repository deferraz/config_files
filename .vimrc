execute pathogen#infect()

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better identation

set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80

set history=700
set undolevels=700

set expandtab
set tabstop=4
set softtabstop=4
set shiftround

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax on
set background=dark

" Settings for ctrlp
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/* 

" Powerline
set t_Co=256
" let g:Powerline_symbols = 'fancy'
set laststatus=2

set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

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
