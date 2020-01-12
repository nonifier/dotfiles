call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'  
Plug 'tomasr/molokai'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'wincent/terminus'

call plug#end()

colorscheme molokai

map <Space> <leader>
map <leader>f :FZF<cr>
map <leader>b :Buffers <cr>
map <leader>W :Windows <cr>
map <leader>w :w<cr>
map <leader>q <C-w><C-q>
map <leader>h :History <cr>
map <leader>s :BLine <cr>
map <leader>S :BLine <C-r>"<cr>
map <leader>st :BTags <cr>
map <leader>ST :BTags <C-r>"<cr>
map <leader>r :Rg! <cr>
map <leader>R :Rg <C-r>+<cr>
map <leader>yr yiw<leader>R 
map <leader>y "+y
map <leader>Y "*y
map <leader>t :Tags <cr>
map <leader>T :Tags <C-r>"<cr>
map <leader>c :History: <cr>
map <leader>ct :! ctags -R . <cr><cr>

set undofile
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

set tabstop=4
set shiftwidth=4
set expandtab
set number
set cursorline
set mouse=a
set autoread
set clipboard=unnamed
set noswapfile

au FocusGained,BufEnter,CursorMoved,CursorHold * checktime
