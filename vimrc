set hlsearch "Highlighting Keyworkd
set ruler  "Display current cursor
set incsearch
set nu " Display line number
set title
set smartindent
set cindent
set autowrite
set autoread
set scrolloff=2
set wildmode=longest,list
set si "When change the line, autoindent
set ts=4   "tag select
set sts=4    "st select
set sw=1    "width of scroll bar
set bs=eol,start,indent
set history=256
set laststatus=2   "Always display status
set paste  "Remove staircase phenomenon
set showmatch "Highlight corresponding bracket
set smartcase "case-sensitive search
set shiftwidth=2 "Set width of auto indent (sw=2)
set tabstop=2 "(ts=2)
set softtabstop=2 "(sts=2)
set expandtab
set smarttab
set ai "Auto indent


set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.\+/

"Locate the cursor at the place exited last
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
 
"Use syntax highlighting
if has("syntax")
  syntax on
endif

highlight Comment term=bold cterm=bold ctermfg=4

" File Encoding to Korean
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
 
map 1 mA
map 2 mB
map 3 mC
map 4 mD
map 5 mE
  
map 11 :w<CR>'A
map 22 :w<CR>'B
map 33 :w<CR>'C
map 44 :w<CR>'D
map 55 :w<CR>'E
map `` :e#<CR>
  
map <s-c> :vs./<CR>
map <tab><tab> <c-w><c-w>
imap <tab><tab> <Esc><C-W><C-W>
 
map <c-s> :w<cr>
imap <c-s> <esc>:w<cr>
 
 
function SetTags()
  let curdir = getcwd()
    while !filereadable("tags") && getcwd() != "/"
      cd ..
     endwhile
  if filereadable("tags")
  execute "set tags=" . getcwd() . "/tags"
  endif
  execute " cd " . curdir
endfunction
 
call SetTags()

set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
 
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if(!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppresss 'dubplicate connection ' error
    exe "cs add " . db . "" . path
    set cscopeverbose
   endif
endfunction
au BufEnter /* call LoadCscope()
 
"set the rumtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
  
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}
  
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'The-NERD-Tree'
Plugin 'Tagbar'


