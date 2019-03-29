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

	packadd vim-unimpaired
	packadd denite.nvim

	" Replace grep with ag
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts', ['-s', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

	" Ag for everything :D
	call denite#custom#var('file', 'command',
				\ ['fd', '-i', '-L', '-c', 'never', '-d', '1', '-t', 'file', ''])
	call denite#custom#var('file/rec', 'command',
				\ ['fd', '-i', '-L', '-c', 'never', '-t', 'file', ''])
	call denite#custom#var('directory_rec', 'command',
				\ ['fd', '-i', '-L', '-c', 'never', '-t', 'd', ''])

	" Denite binds
	call denite#custom#map('normal', 'V', '<denite:do_action:vsplit>')

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
set directory=$HOME/.vim/swapfiles//

let g:python3_host_prog="/usr/bin/python"
let g:AutoPairsFlyMode=1
let g:prettier#autoformat=0
let g:prettier#quickfix_enabled=0
let g:user_emmet_leader_key='<M-e>'
let g:user_emmet_settings = {
		\'javascript': {
			\'extends': 'jsx'
		\}
	\}
let $GIT_EDITOR = 'nvr -cc split --remote-wait'

" All da binds
nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>
nnoremap 0 ^
tnoremap <ESC> <C-\><C-n>
nnoremap <silent> <m-a> :tabprevious<CR>
nnoremap <silent> <m-d> :tabnext<CR>
nnoremap <m-h> <c-w>h
nnoremap <m-l> <c-w>l
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-H> <c-w>H
nnoremap <m-L> <c-w>L
nnoremap <m-J> <c-w>J
nnoremap <m-K> <c-w>K
nnoremap <m-z> <c-w>z
nnoremap <silent> <m-f> :call focus#toggle()<CR>
command WQ mksession! | qall
" Leader key stuff
let mapleader = ";"
nnoremap <space> ;
" coc.nvim
nnoremap <silent> K :call CocAction("doHover")<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
nmap <leader>c <Plug>(coc-rename)
nnoremap <silent> <leader>s :Denite coc-symbols<CR>
" denite
nnoremap <silent> <leader>b :Denite buffer<CR>
nnoremap <silent> - :Denite file/rec<CR>
nnoremap <silent> + :Denite -default-action=touch directory<CR>
" tig
nnoremap <silent> <leader>t <C-w>v:te tig status<CR>i
" easymotion
map <leader>w <Plug>(easymotion-bd-w)
map <leader>f <Plug>(easymotion-bd-f)
map <leader>j <Plug>(easymotion-bd-jk)
map <leader>e <Plug>(easymotion-bd-e)

augroup prettier
	autocmd! BufWritePre *.js Prettier
	autocmd! BufWritePre *.re call CocAction("format")
augroup END
