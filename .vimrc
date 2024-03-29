set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
augroup END

set ignorecase
set smartcase

" activates syntax highlighting among other things
syntax on

let mapleader = "\<Space>"
" show and switch to buffer with a shortcut
nnoremap gb :ls<CR>:b<Space>

" PEP8
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:jedi#show_call_signatures = "0"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

set nocompatible              " be iMproved, required
filetype off                  " required

set pastetoggle=<F3>

" cursor colors
set cursorline
highlight CursorLine   cterm=NONE
highlight CursorLineNr ctermbg=None ctermfg=Black
highlight Pmenu      ctermfg=White

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLineNr ctermbg=Green ctermfg=None 

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLineNr ctermbg=None ctermfg=Black

" Git commit: start in INSERT mode
autocmd FileType gitcommit exec 'au VimEnter * startinsert'

" Set autocorrect 
autocmd FileType latex,tex,md,markdown setlocal spell spelllang=de 
autocmd FileType latex,tex,md,markdown,asciidoc setlocal complete+=kspell

autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

hi SpellBad cterm=underline ctermfg=red ctermbg=None

" Changes the cursor depending on the mode. But changes the cursor in the
" terminal too
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" activates filetype detection
filetype plugin indent on    " required
