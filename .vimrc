set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()

call vundle#begin()

Plugin 'leafgarland/typescript-vim'
Plugin 'morhetz/gruvbox'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'heavenshell/vim-tslint'

" Haskell
Plugin 'gmarik/Vundle.vim'
Plugin 'mlent/ale'
Plugin 'vim-airline/vim-airline'
"Plugin 'eagletmt/ghcmod-vim'
"Plugin 'Shougo/vimproc'

Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'junegunn/fzf.vim' " fuzzy file finder
Plugin 'mileszs/ack.vim' " fuzzy multi-file line searching
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'

" Plugin 'posva/vim-vue'
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/tsuquyomi-vue'


call vundle#end()            " required
filetype plugin indent on    " required

set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors = 256
let g:gruvbox_hls_cursor = 'orange'
colorscheme gruvbox 


" Indentation
set tabstop=2
set shiftwidth=2
set expandtab

" let g:typescript_indent_disable = 1 " Disable typesctipt standard indentation

" Haskell
filetype plugin indent on
let g:airline#extensions#ale#enabled = 1

nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
let g:ale_linters = {
      \   'haskell': ['hlint', 'hdevtools'],
      \   'javascript': ['eslint'],
      \   'typescript': ['tslint'],
      \}
let g:ale_fixers = {
      \    'javascript': ['eslint'],
      \    'vue': ['eslint'],
      \    'scss': ['prettier'],
      \    'html': ['prettier']
      \}
let g:ale_fix_on_save = 1

autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

" let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_sass=1

autocmd BufNewFile,BufRead *.vue set filetype=vue

