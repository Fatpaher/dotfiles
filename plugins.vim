
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
Plugin 'nathanaelkane/vim-indent-guides'
" html tags highliting"
Plugin 'gregsexton/MatchTag'
Plugin 'kylef/apiblueprint.vim'

"slim linter
"Plugin 'lim-template/vim-slim'

Plugin 'vim-ruby/vim-ruby'

"ruby refactoring
Plugin 'ecomba/vim-ruby-refactoring'
"Plugin 'ztmhedberg/matchit'

" JavaScript and JSX highlining
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'albertocg/contrastneed-theme'
Plugin 'blueshirts/darcula'
" Coments
Plugin 'tpope/vim-commentary'
"Search
Plugin 'mileszs/ack.vim'
"Rubocop linter
Plugin 'ngmy/vim-rubocop'

"super tab
Plugin 'ervandew/supertab'

"Create path to test files
Plugin 'compactcode/alternate.vim'
" open test files
Plugin 'compactcode/open.vim'

call vundle#end()
filetype plugin indent on
filetype plugin on
