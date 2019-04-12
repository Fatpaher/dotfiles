syntax on

"-------------------------Vizuals----------------------------------------------
set relativenumber
set number
set laststatus=2

"latest vim settings/options
set nocompatible

set tags=./tags;

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" To install plugins
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall

"source the plugin file
so ~/dotfiles/plugins.vim

set t_Co=256
colorschem darcula

set complete=w,.,b,u
let g:SuperTabDefaultCompletionType = "<c-n>"

"------------- Set up persistent undo (with all undo files in one directory)---
if has('persistent_undo')
  set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES
set undolevels=5000

"--------------------- Fold lines according to the file's syntax--------------
"set foldmethod=syntax

" Make folds auto-open and auto-close when the cursor moves over them
":set foldopen=all
":set foldclose=all

" -------------------Make it obvious where 80 characters is--------------------
set textwidth=80
set colorcolumn=+1

" Highlight anything in the 81st column or later

highlight OverLength ctermbg=darkgrey ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"---------------------------------NERDTree Configuration-------------------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
  call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
"-------------------------------------------------------------------------------

"--------------------------Slim linter------------------------------------------
syntax enable
filetype plugin indent on
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
"------------------------CtrlPsettings--------------------------------------
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/vendor/*,*/tmp/*,*.so,*.swp,*.zip,*/migrate/*,*/.git/*
"Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"match window config
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'

"-----------------------Syntactic settings--------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" set location-list window height to  lines
let g:syntastic_loc_list_height=2

" Make :help appear in a full-screen tab, instead of a window
augroup HelpInTabs
  autocmd!
  autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

function! HelpInNewTab ()
  if &buftype == 'help'
    execute "normal \<C-W>T"
  endif
endfunction

" Allow deletes in Insert mode to keep deleting past the insertion point
set backspace=indent,eol,start

" Autoave options
let g:auto_save = 1  " enable AutoSave on Vim startup "
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode "
let g:auto_save_silent = 1  " do not display the auto-save notification "

" Automatically source .vimrc file on save
" autocmd BufWritePost .vimrc source %

" set Leader to space
let mapleader = " "

" ---------------------------Search------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
"-----------------------------RussianKeyboard----------------------------------
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" ---------------------------Mappings------------------------------------------
" Tabs navigation shortcuts
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" fugitive.vim hotkeys -- work with git
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>
nnoremap gb :Gblame<CR>
nnoremap ge :Gbrowse<CR>
nnoremap gw :Gwrite<CR>

" vim-test mappings/rspec
map <Leader>st :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

" switch to test file
map <Leader>sf :Open(alternate#FindTest())<CR>

"---------------------.vimrc Configuration---------------------
" open .vimrc file
nmap <Leader>cv :tabedit $MYVIMRC<CR>
" open plugins.vim file
nmap <Leader>cp :tabedit ~/dotfiles/plugins.vim<CR>
" source .vimrc file
nmap <Leader>cs :source ~/.vimrc<CR>


"Generate ctags for rails project
nmap <Leader>ct :!ctags -R --languages=ruby --exclude=.git --exclude=log.$(bundle list --paths)<CR>

"open ruby snippets
nmap <Leader>sr :tabedit ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<CR>

" disable search highlight
nmap <Leader>/ :nohlsearch<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>fe :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>fs :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>fv :vsplit <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Toggle NERD Tree
nmap <Leader><Tab> :NERDTreeToggle<CR>


"Rails shorcuts
"vertical
nmap <Leader>vr :vsp config/routes.rb<CR>
nmap <Leader>vs :Vschema<CR>
nmap <Leader>vc :Vcontroller
nmap <Leader>vm :Vmodel
nmap <Leader>vv :Vview
nmap <Leader>vd :Vmigration<CR>
"current window
nmap <Leader>er :open config/routes.rb<CR>
nmap <Leader>es :Eschema<CR>
nmap <Leader>ec :Econtroller
nmap <Leader>ev :Eview
nmap <Leader>em :Emodel
nmap <Leader>ed :Emigration<CR>

" Use arrow keys to navigate after a :vimgrep or :helpgrep
nmap <Leader><RIGHT>         :cnext<CR>
nmap <Leader><RIGHT><RIGHT>  :cnfile<CR><C-G>
nmap <Leader><LEFT>          :cprev<CR>
nmap <Leader><LEFT><LEFT>    :cpfile<CR><C-G>

" ------------------------Rubocop vim-------------------------------------------
let g:vimrubocop_keymap = 0
nmap <Leader>rc  :RuboCop <CR>
" autofix with rubocop
nmap <Leader>rf :RuboCop -a <CR>
let g:vimrubocop_config = '~/.rubocop.yml'

" Tab navigation like Firefox---.
nnoremap <Tab>   :tabnext<CR>

" set paste on/off
nmap <Leader>cp :set paste<CR>
nmap <Leader>cP :set nopaste<CR>

" Ruby Refactoring Tool for Vim
:nnoremap <leader>rap  :RAddParameter<cr>
:nnoremap <leader>rcpc :RConvertPostConditional<cr>
:nnoremap <leader>rel  :RExtractLet<cr>
:vnoremap <leader>rec  :RExtractConstant<cr>
:vnoremap <leader>relv :RExtractLocalVariable<cr>
:nnoremap <leader>rit  :RInlineTemp<cr>
:vnoremap <leader>rrlv :RRenameLocalVariable<cr>
:vnoremap <leader>rriv :RRenameInstanceVariable<cr>
:vnoremap <leader>rem  :RExtractMethod<cr>

"------------------ CtrlP mappings ----------------
nmap <leader>r :CtrlPMRUFiles<cr>
"-------------------------------Layout------------------------------------------

"----------------------------Thoughbot-----------------------------------------

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
nnoremap <Leader>cr :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

