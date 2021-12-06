set clipboard+=unnamedplus

set hidden
set number
set ignorecase
set smartcase
set mouse=a
set scrolloff=8
set sidescrolloff=8
set autoread
set signcolumn=no

" restore cursore on open
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

let mapleader="\<space>"
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

nmap <leader>f :Files <C-r>=expand("%:h")<CR>/<CR>
nmap <leader>b :Buffers<cr>

map gn :bn<cr>
map gp :bp<cr>
map gk :bd<cr>
map gs :G<cr>

" reselect visual selection after intending
vnoremap < <gv
vnoremap > >gv

"Allow gf to open non-existent files
map gf :edit <cfile><cr>

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/oscyank.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/fugitive.vim

" Plug 'neovim/nvim-lspconfig'

call plug#end()

" source ~/.config/nvim/plugins/lspconfig.vim
