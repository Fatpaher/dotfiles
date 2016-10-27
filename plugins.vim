
"-------------------------Plugins-----------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Townk/vim-autoclose'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-scripts/vim-auto-save'

" html tags highliting"
Plugin 'gregsexton/MatchTag'

" JavaScript and JSX highlining
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'albertocg/contrastneed-theme'
" Coments
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on
filetype plugin on
