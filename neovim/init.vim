" File              : init.vim
" Author            : Petr Čumpelík <cumpepe1@fit.cvut.cz>
" Date              : 03.06.2021
" Last Modified Date: 24.06.2021
" Last Modified By  : Petr Čumpelík <cumpepe1@fit.cvut.cz>
" Last Modified By  : Petr Čumpelík <cumpepe1@fit.cvut.cz>
" File              : init.vim
" Date              : 12.04.2021
" Last Modified Date: 12.04.2021
" Dont try to be vi compatible
set nocompatible

set encoding=utf-8

syntax enable

" Enable hidden buffers
set hidden

" Sane settings
filetype plugin on
syntax on

" Relative Linenumbers
set nu rnu

" Mouse support
set mouse=a

set signcolumn=yes

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
			\'coc-clangd',
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
" let g:airline_theme           = 'violet'
" let g:airline_theme           = 'deus'
let g:airline_theme           = 'ayu'

" Goyo settings
let g:goyo_width = "70%"

" Manage plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
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
Plug 'https://github.com/ayu-theme/ayu-vim.git'
Plug 'PontusPersson/pddl.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'ryanoasis/vim-devicons'
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

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

nnoremap <leader>gm :call GitMessanger


" some more coc settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
