" Dont try to be vi compatible
set nocompatible

" Enable hidden buffers
set hidden

" Sane settings
filetype plugin on
syntax on

" Relative Linenumbers
set nu rnu

" Mouse support
set mouse=a

let g:norxvt = $TERM !~ "rxvt*"
let g:rxvt = $TERM =~ "rxvt*"

" Truecolor
if exists("$TERM")
	if g:norxvt " don't try Truecolor with rxvt
		set termguicolors
	end
end

" Tab to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Settings for vim-polyglot
let g:polyglot_disabled = ['markdown']

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
let g:neosolarized_contrast         = "high"
let g:neosolarized_visibility       = "high"
let g:neosolarized_bold             = 1
let g:neosolarized_underline        = 1
let g:neosolarized_italic           = 1
let g:neosolarized_termBoldAsBright = 0

set background=dark

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'violet'

" Goyo settings
let g:goyo_width = "70%"

" Manage plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'powerline/fonts'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'overcache/NeoSolarized'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'gko/vim-coloresque'
Plug 'rhysd/vim-clang-format'
Plug 'luochen1990/rainbow', { 'for': ['scheme', 'racket', 'lisp'] }
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-sensible'
Plug 'sainnhe/edge'
Plug 'dracula/vim', {'as': 'dracula' }
Plug 'liuchengxu/space-vim-dark'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'itchyny/landscape.vim'
Plug 'soli/prolog-vim'
Plug 'metakirby5/codi.vim'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'Mizux/vim-colorschemes'
Plug 'atahabaki/archman-vim'
Plug 'gkjgh/cobalt'
Plug 'herrbischoff/cobalt2.vim'
Plug 'afgomez/better-cobalt.vim'
Plug 'zeis/vim-kolor'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'rakr/vim-one'
call plug#end()

" Set rainbow parentheses
let g:rainbow_active = 1
" Set colorscheme

if g:norxvt
	colorscheme dracula
else
	colorscheme better-cobalt
end

" NERDTree config
" <C-t> = ctrl-t
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t>     :NERDTreeToggle<CR>
nnoremap <C-f>     :NERDTreeFind<CR>

" Markdown settings
autocmd bufreadpre *.md setlocal conceallevel=2
autocmd bufreadpre *.md setlocal nofoldenable

" VimWiki settings
let wiki = {}
let g:vimwiki_list = [{'path': '$HOME/vimwiki', 'template_path': '$HOME/vimwiki_tpl'}]

" Default <leader> is '\'
" Edit config
" <S-s> = Shift-s
nnoremap <leader><S-s> :Ex $HOME/dotfiles<CR>
nnoremap <leader>s     :e $HOME/dotfiles/neovim/init.vim<CR>

" Save as root
command! -nargs=0 Sw w !sudo -S tee % > /dev/null

