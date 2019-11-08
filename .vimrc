syntax on
set modelines=0

" Wrap text
set wrap

" Show line numbers
set number

" Base formatting options
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent
set cindent

" Auto indent properly
" inoremap { {<CR>}<up><end><CR>

" Map files pane to semicolon
noremap ; :Files<CR>
noremap <leader>\ :SyntasticReset<CR>
noremap <leader>r :silent !ctags -R .<CR>:redraw!<CR>
noremap <leader>c :silent !~/.vim/cscope_gen.sh <CR>:redraw!<CR>

" Mouse scroll 
set scrolloff=5

" Fix backspace problems
set backspace=indent,eol,start

" Ctags enable
set tags=tags

" Status bar
set laststatus=2

" Highlight matching pairs of brackets. Use % to jump
set matchpairs+=<:>

" Display options
set showmode
set showcmd

" Highlight matching search patterns
set hlsearch

" Theme
let g:airline_theme='onedark'
hi TabLineFill ctermfg=5

" Cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" diff colors
if &diff
      colorscheme diffcolors
endif

" Plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'simplyzhao/cscope_maps.vim'

call plug#end()
