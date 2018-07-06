set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive.git'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set et
set sw=2
set ts=2
set number
set bg=dark

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

highlight Tabs ctermbg=red guibg=red
highlight TrailingSpaces ctermbg=lightred guibg=lightred
if !exists('w:trailingSpaces') | let w:trailingSpaces=matchadd('TrailingSpaces', ' \+$') | endif
if !exists('w:tabs') | let w:tabs=matchadd('Tabs', '	') | endif
autocmd WinEnter * if !exists('w:trailingSpaces') | let w:trailingSpaces=matchadd('TrailingSpaces', ' \+$') | endif
autocmd WinEnter * if !exists('w:tabs') | let w:tabs=matchadd('Tabs', '	') | endif

" Show list of buffers using leader key (default \)b
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :vs<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>a :Ag<CR>

nnoremap <A-b> :Make<cr>
nnoremap <A-n> :cn<CR>
nnoremap <A-p> :cp<CR>
