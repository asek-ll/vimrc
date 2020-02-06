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

"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

filetype plugin on

silent! colorscheme jellybeans
