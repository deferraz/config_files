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
