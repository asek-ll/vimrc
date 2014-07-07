let $MYVIMRC = $VIM.'/vimrc'
set nocompatible
set encoding=UTF8

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch

set clipboard=unnamed
set wildmenu
set listchars=eol:¬
set list

set foldlevelstart=3

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('gui_running')
  if has('gui_gtk')
    set guifont=Ubuntu\ Mono\ 14
  elseif has('gui_win32')
    set guifont=Consolas:h14
  endif
endif

colorscheme jellybeans
"set background=light
"colorscheme solarized

let g:XkbSwitchEnabled = 1 
let g:XkbSwitchIMappings = ['ru']

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"INDENT

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

"SOME APPE

set nu
set rnu
set autoread 
if has('mouse')
  if has('gui_running')
    set mouse=a
  else
    set mouse=nv
  endif
endif
set cursorline
set guioptions-=T
set guioptions-=m
set ignorecase
"BACKUP

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set backupdir=$HOME/.vim/.vimbackup
set directory=$HOME/.vim/.vimbackup
"MAP

nmap <C-Tab> gt 
nmap <C-S-Tab> gT 
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :TagbarToggle<CR>
nmap <F3> :CtrlP .<CR>
nmap <F4> :CtrlPBuffer<CR>
nmap <A-1> :NERDTreeFind<CR>
nmap <C-K> \ci
nmap <F9> :w<CR>:make<CR>
nmap <F10> :silent !%:t:r.exe<CR>
nmap <F11> :mks! ~/.vimsess<CR>
nmap <F12> :so ~/.vimsess<CR>

"VUNDLE

filetype off    

"set rtp+=$VIM/vimfiles/bundle/eclim/
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc()

"Bundle 'gmarik/vundle'
Bundle 'git://github.com/digitaltoad/vim-jade.git'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
  let coffee_make_options = '--bare'

Bundle 'git://github.com/heavenshell/vim-jsdoc.git'
  let g:jsdoc_additional_descriptions = 1
  let g:jsdoc_allow_input_prompt = 1

"Bundle "pangloss/vim-javascript"

"Bundle "maksimr/vim-jsbeautify"
"let g:config_Beautifier = {}
"let g:config_Beautifier.js = {
      "\ 'indent_style': 'space',
      "\ 'indent_size' : '2' }

"Bundle "einars/js-beautify"
"Bundle "marijnh/tern_for_vim"

Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/majutsushi/tagbar.git'

Bundle 'git://github.com/kien/ctrlp.vim.git'
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](\.git|_x)$'
        \ }

Bundle 'git://github.com/spf13/PIV.git'
  let g:DisableAutoPHPFolding = 1 
Bundle 'git://github.com/thinca/vim-template.git'
Bundle 'tpope/vim-surround'

Bundle 'bling/vim-airline'
  let g:airline_theme='dark'
  set laststatus=2

"snippets
"Bundle 'git://github.com/SirVer/ultisnips.git'

"Bundle 'git://github.com/msanders/snipmate.vim.git'
  "let g:snippets_dir=$VIM.'/vimfiles/snippets'

Bundle 'git://github.com/drmingdrmer/xptemplate.git'
  let g:xptemplate_key='<Tab>'
  let g:xptemplate_nav_next = '<C-j>'
  let g:xptemplate_nav_prev = '<C-k>'
  let g:xptemplate_highlight = ''
  "let g:xptemplate_brace_complete = 1

"project
Bundle 'git://github.com/plasticboy/vim-markdown.git'

"syntax
Bundle 'git://github.com/scrooloose/syntastic.git'
  let g:syntastic_enable_signs=1 
  let g:syntastic_php_checkers=['php']
  let g:syntastic_css_checkers=['csslint', 'prettycss']
  let g:syntastic_javascript_jslint_conf = "--nomen --sloppy --white --vars --plusplus"
  let g:syntastic_java_checkstyle_classpath = $VIMRUNTIME.'\checkstyle-5.5-all.jar'
  let g:syntastic_java_checkstyle_conf_file = 'D:/_programs/paps/CommonFiles/cygwin/home/den/sun_checks.xml'

"Bundle 'git://github.com/Valloric/YouCompleteMe.git'
Bundle 'Raimondi/delimitMate.git'
  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1
  let g:delimitMate_matchpairs = "(:),[:],{:}"

Bundle 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

Bundle 'Shougo/vimproc.vim'
  let g:vimproc#dll_path = $HOME.'\.vim\bundle\vimproc.vim\autoload\vimproc_win32.dll'

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell.vim'

Bundle 'godlygeek/tabular'

Bundle 'tpope/vim-fugitive'

if has("autocmd")
  filetype plugin indent on
  augroup vimrc
    au!

    "autocmd FileType text setlocal textwidth=78
    "autocmd BufReadPost *
          "\ if line("'\"") > 1 && line("'\"") <= line("$") |
          "\   exe "normal! g`\"" |
          "\ endif

    au BufRead,BufNewFile *.inc set ft=php
    au BufRead,BufNewFile *.install set ft=php
    au BufWritePost *.coffee silent CoffeeMake!
    au User plugin-template-loaded call s:template_keywords()
    au BufWritePost vimrc :so $MYVIMRC

    au VimLeave * :mks! ~/.lastvimsess
    "au VimEnter * :so! ~/.lastvimsess

  augroup END
else
  set autoindent " always set autoindenting on
endif " has("autocmd")

filetype plugin on

function! s:template_keywords()
  if search('${name}')
    silent %s/\${name}/\=expand('%:t:r')/g
  endif
  if search('${fullname}')
    silent %s/\${fullname}/\=expand('%:t')/g
  endif
  if search('${user}')
    silent %s/\${user}/Denis Blokhin/g
  endif
  if search('${date}')
    silent %s/\${date}/\=strftime('%Y-%m-%d')/g
  endif
  if search('${time}')
    silent %s/\${time}/\=strftime('%H:%M:%S')/g
  endif
endfunction

"XTERM
if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  " restore screen after quitting
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif
