" vim:ft=vim:

let $VIMBASE=$HOME."/.config/nvim"

source $VIMBASE/startup/settings

filetype off

set rtp+=$VIMBASE/plugins/Plug.vim/
call plug#begin()

"NeoBundleFetch 'Shougo/neobundle.vim'
Plug 'asek-ll/asek-ll.vim'

source $VIMBASE/startup/bundles/base
source $VIMBASE/startup/bundles/programming
source $VIMBASE/startup/bundles/javascript/js

Plug 'jceb/vim-orgmode'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

set termguicolors     " enable true colors support

Plug 'NLKNguyen/papercolor-theme'
set background=light

call plug#end()

filetype plugin on

silent! colorscheme PaperColor

set guifont=JetBrains\ Mono:h16

if exists('g:started_by_firenvim')
  set guifont=JetBrains_Mono:h10
endif
