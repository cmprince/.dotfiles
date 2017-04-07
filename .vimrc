" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme) 
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Syntastic' " uber awesome syntax and errors highlighter
    Plugin 'https://github.com/Valloric/YouCompleteMe'
    Plugin 'altercation/vim-colors-solarized' " T-H-E colorscheme
    Plugin 'molokai'
    Plugin 'badwolf'
    Plugin 'https://github.com/tpope/vim-fugitive' " So awesome, it should be illegal 
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    " ...All your other bundles...
    if iCanHazVundle == 0
        echo "Installing Vundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif

    call vundle#end() 
    " must be last
    filetype plugin indent on " load filetype plugins/indent settings

    " Setting up Vundle - the vim plugin bundler end
    syntax enable                      " enable syntax
    set number              " line numbers
    set ts=4                " 4 sp per tab
    set shiftwidth=4        " 
    set autoindent          " what do you think
    set expandtab           " expand all tabs
    set t_Co=256            " needed for airline colors
    set cursorline          " faint background or underline
    colorscheme badwolf
    set wildmenu            " list autocomplete suggestions
    set laststatus=2        " force airline to show
    set encoding=utf-8      " unicode
    set incsearch           " search as you type
    set hlsearch            " highlight searches
    nnoremap <leader><space> :nohlsearch<CR> " turn off highlighting
    nnoremap <leader>1 :set number!<CR>      " toggle line numbers

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:airline_powerline_fonts = 1   " fancy symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"
    let g:airline#extensions#tabline#enabled=1 " buffer list
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let python_highlight_all=1

    " Terminal-dependent colors, since PuTTY doesn't do transparency
    let term = $TERM
    if term != "putty-256color"     " default to black otherwise
        hi LineNr             ctermbg=NONE    
        hi Normal             ctermbg=NONE
    endif
    hi MatchParen         ctermbg=green
    hi Todo               ctermbg=red
    hi ErrorMsg           ctermbg=NONE
    hi Comment            term=bold ctermfg=250 ctermbg=17 guifg=#857f78
