
" Dont try to be vi compatible
set nocompatible

" Relative Linenumbers
set nu rnu

" Mouse support
set mouse=a

" Truecolor
set termguicolors

" Settings for vim-polyglot
let g:polyglot_disabled = ['']

" Autocompleters for coc.nvim
let g:coc_global_extensions = [
			\'coc-json',
			\'coc-git',
			\'coc-svelte',
			\'coc-tsserver',
			\'coc-python',
			\'coc-json',
			\'coc-java',
			\'coc-html',
			\'coc-discord-rpc',
			\'coc-css',
			\'coc-clangd'
			\]

" Colorscheme Settings
let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
let g:neosolarized_termBoldAsBright = 1
set background=dark

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'

" Manage plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'powerline/fonts'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'overcache/NeoSolarized'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

" Set colorscheme
colorscheme NeoSolarized

"NERDTree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
