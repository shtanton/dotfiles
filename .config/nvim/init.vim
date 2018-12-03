set nocompatible

packadd minpac

if !exists('*minpac#init')
	colorscheme slate
else
	call minpac#init()

	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" TIM POPE
	call minpac#add('tpope/vim-surround', {})
	call minpac#add('tpope/vim-repeat', {})
	call minpac#add('tpope/vim-unimpaired', {})

	call minpac#add ('easymotion/vim-easymotion', {})

	" Languages
	call minpac#add('neoclide/jsonc.vim', {})
	call minpac#add('reasonml-editor/vim-reason-plus', {})

	call minpac#add('arcticicestudio/nord-vim', {})
	call minpac#add('neoclide/coc.nvim', {'do': { -> coc#util#install() }})

	call minpac#add('Shougo/denite.nvim', {'type': 'opt'})

	" Custom Denite config
	packadd denite.nvim

	" Replace grep with ag
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

	" Ag for everything :D
	call denite#custom#var('file', 'command',
				\ ['ag', '-i', '--follow', '--nocolor', '--nogroup', '-g', '-n'])
	call denite#custom#var('file/rec', 'command',
				\ ['ag', '-i', '--follow', '--nocolor', '--nogroup', '-g', ''])

	colorscheme nord
endif

set hidden
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set relativenumber
set cursorline
filetype plugin indent on
syntax on
set incsearch
set showcmd
set laststatus=2
set noswapfile
set ai
set si
set listchars=tab:\|\ 
set list
set cmdheight=2

let g:python3_host_prog="/usr/bin/python"

" All da binds
nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>
nnoremap 0 ^
" Leader key stuff
let mapleader = ";"
nnoremap <space> .
nnoremap . ;
" coc.nvim
nnoremap <silent> K :call CocAction("doHover")<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "<S-Tab>"
" denite
nnoremap <silent> <leader>d :DeniteProjectDir file/rec<CR>
