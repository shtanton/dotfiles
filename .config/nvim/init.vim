set nocompatible              " be iMproved, required

if !has('nvim') && empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdcommenter'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-abolish'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'gregsexton/gitv'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'arcticicestudio/nord-vim'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }

Plug 'roxma/vim-hug-neovim-rpc', !has('nvim') ? {} : { 'on': [] }
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'reasonml-editor/vim-reason-plus'
Plug 'leafgarland/typescript-vim'

call plug#end()

set hidden
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=2
set relativenumber
set cursorline
filetype plugin indent on
set incsearch
set showcmd
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
set noswapfile
set ai
set si
set listchars=tab:\|\ 
set list
colorscheme nord
autocmd BufRead,BufNewFile _oasis set expandtab

nnoremap <c-e> 5<c-e>
nnoremap <c-y> 5<c-y>
let mapleader = " "
nnoremap 0 ^
nnoremap <leader>w :ArgWrap<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:user_emmet_leader_key='<C-K>'
let g:user_emmet_settings = {
			\	'indentation' : '  ',
			\	'javascript.jsx': {
			\		'extends': 'jsx',
			\	},
			\	'html': {
			\		'inline_elements': '',
			\	},
			\}

let g:jsx_ext_required = 0

let g:UltiSnipsExpandTrigger = '<c-f>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
let g:UltiSnipsSnippetsDir = $HOME . '/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories = [g:UltiSnipsSnippetsDir]
let g:UltiSnipsUsePythonVersion = 3

let g:AutoPairsFlyMode = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

let g:deoplete#enable_at_startup = 1

let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = $HOME . "/.config/nvim/languageSettings.json"
let g:LanguageClient_serverCommands = {
	\'reason': ['ocaml-language-server', '--stdio'],
	\'ocaml': ['ocaml-language-server', '--stdio'],
	\'javascript': ['javascript-typescript-stdio'],
	\'javascript.jsx': ['javascript-typescript-stdio'],
	\'typescript': ['javascript-typescript-stdio'],
	\}
