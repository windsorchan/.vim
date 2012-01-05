" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax enable
syntax on

" set omnicompletion on
"set ofu=syntaxcomplete#Complete

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Settings for tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set the search scan to wrap around the file
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it...
" turns out he was right :)
set incsearch

" show line numbers
set number

" remap esc key to jj to exit insert mode
inoremap jj <ESC>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Maps to make handling windows a bit easier
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make mappings
nmap <silent> ,mi :make DEBUG=1 install<CR>
nmap <silent> ,mr :make DEBUG=1<CR>

" Search the current file for what's currently in the search register and display matches
nmap <silent> ,gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current directory for the WORD under the cursor and display matches
nmap <silent> ,gc :grep -R --include=*.{cpp,h} <C-r><C-w> *<CR>:ccl<CR>:cwin<CR>

" System default for mappings is now the "," character
let mapleader = ","

" set the colorscheme
" set t_Co=256
colorscheme wombat256

" Workaround to stop make/quickfix from creating a new file
set errorformat^=%-GIn\ file\ included\ %.%# 


"-----------------------------------------------------------------------------
" pathogen Settings
"-----------------------------------------------------------------------------
call pathogen#infect()
call pathogen#helptags()

"-----------------------------------------------------------------------------
" snipMate Settings
"-----------------------------------------------------------------------------
nmap <silent> ,ec :e $HOME/.vim/bundle/snipmate/snippets/c.snippets<CR>
nmap <silent> ,ep :e $HOME/.vim/bundle/snipmate/snippets/cpp.snippets<CR>

"-----------------------------------------------------------------------------
" clang_complete Settings
"-----------------------------------------------------------------------------
let g:clang_auto_select = 1
let g:clang_periodic_quickfix = 0
" let g:clang_snippets = 1
" let g:clang_conceal_snippets = 0
let g:clang_use_library = 1

"-----------------------------------------------------------------------------
" ctrlp Settings
"-----------------------------------------------------------------------------
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.deps/*,*.o,*.so*,*.vcproj

" Search by filename not full path as default
let g:ctrlp_by_filename = 1

" Don't manage working directory
let g:ctrlp_working_path_mode = 0


"-----------------------------------------------------------------------------
" Minibuf Explorer Settings
"-----------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"-----------------------------------------------------------------------------
" Tags Settings
"-----------------------------------------------------------------------------
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=./

" build tags of your own project with Ctrl-F12
nnoremap <C-F10> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

:function! CustomTagSelect()
 :let activeWord=expand("<cword>")
 :let selectExpr='tselect '.activeWord 
 :exec selectExpr
:endfunction 

map ,] :call CustomTagSelect()

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.CUTLERGROUP', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$', '\.o$', '\.vcproj$', '\.so$', '\.so.1$', '\.so.1.0$']



"-----------------------------------------------------------------------------
" TagBar Plugin Settings
"-----------------------------------------------------------------------------
nnoremap <silent> <F9> :TagbarToggle<CR>

"-----------------------------------------------------------------------------
" EasyMotion Plugin Settings
"-----------------------------------------------------------------------------
let g:EasyMotion_leader_key = ','

"-----------------------------------------------------------------------------
" vim-R-plugin Settings
"-----------------------------------------------------------------------------
let g:vimrplugin_underscore = 0

