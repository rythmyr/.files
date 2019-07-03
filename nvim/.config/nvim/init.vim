set nocompatible

set runtimepath^=~/.local/nvim
let &packpath = &runtimepath

"================="
"plugin management"
"================="
call plug#begin('~/.local/nvim/plugged')
" support for .editorconfig files
Plug 'editorconfig/editorconfig-vim'

" general syntax checking, autocomplete
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete-clangx'
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

"Syntax checking/linting
Plug 'vim-syntastic/syntastic'

"automatically close braces
Plug 'jiangmiao/auto-pairs'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" typescript support
Plug 'herringtondarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" HTML tags stuff
Plug 'valloric/MatchTagAlways'

" solarized theme
Plug 'altercation/vim-colors-solarized'
call plug#end()

"====================="
"universal vim options"
"====================="
colorscheme solarized "solarized colorscheme, available with plugin 'altercation/vim-colors-solarized'
set hidden " can move away from buffer without saving first
set number " shows line number on current line (or all lines if relativenumber not set
set relativenumber " shows line numbers relative to current line
set numberwidth=5 " set the number of columns of the line numbers to 5 (4 digits + space)
set so=7 " leave at least 7 lines after cursor while scrolling down/above while scrolling up
set wildmenu " menu while tab completing commands
set noea " equalalways, no prevents windows from resizing when you close help/preview
set ar " autoread, if file is changed outside of vim and you switch to that buffer, automatically reload it
set bg=dark " better colors on a dark background
set cursorline " hilight the line with the cursor on it
set cursorcolumn " hilight the column with the cursor on it
set sw=4 " shift width, when tab is pressed, move in 4 spaces
set et " expandtab, use spaces instead of tabs when tab is pressed
set ts=4 " tabstop, display tab characters as 4 spaces
set path=,,.,** " for tab-completing filenames in vim commands, use recursive in current directory. forget /usr/includes. we don't need it.
set incsearch
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,space:·,trail:·,eol:↲
set list " show invisible characters
set updatetime=500
set signcolumn=yes
set ignorecase " ignore case sensitivity in search by default
set smartcase " unless there's a capital letter
set shada+=n~/.local/nvim/viminfo "don't put stuff in the home directory
hi Search ctermfg=13

"=================="
"universal mappings"
"=================="

nnoremap <space> <nop>
let mapleader = " "
nnoremap <leader>ec :tabnew $MYVIMRC<cr>
nnoremap <leader>cr :source $MYVIMRC<cr>

" move lines up and down
noremap _ :normal ddkP<cr>
noremap - :normal ddp<cr>

" surround selection with single/double quotes
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>

" indenting using visual mode keeps selection
vnoremap < <gv
vnoremap > >gv

" complete with tab instead of <c-n> or <c-p>
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"=================="
"universal commands"
"=================="
command! Scratch new<bar>resize 16<bar>setlocal buftype=nofile " open a scratch buffer and make it not huge
command! Term split<bar>resize 20<bar>normal <c-w>J:term<cr>


"=================="
"npm-based projects"
"=================="
if filereadable("package.json")
  set path=src/**,.,, " everything we care about usually is in src/ for npm projects

endif

"==============="
"plugin settings"
"==============="

"deoplete, for asyncronous completions
let g:deoplete#enable_at_startup = 1

"syntastic, for syntax checking
let g:syntastic_always_populate_loc_list = 1

"typescript stuff
fun! s:setTypescriptOptions()
    imap <buffer> <C-Space> <c-x><c-o>
    nnoremap <buffer> <leader>lu :TSRefs<cr>
    nnoremap <buffer> <leader>ld :TSDef<cr>
    nnoremap <buffer> <leader>lt :TSTypeDef<cr>
    nnoremap <buffer> <leader>lr :TSRename <C-r><C-w>
    nnoremap <buffer> <leader>lp :TSDefPreview<cr>
    nnoremap <buffer> <leader>le :TSGetErrorFull<cr>
    nnoremap <buffer> <leader>lf :TSGetCodeFix<cr>
    nnoremap <buffer> <leader>l/ I// <c-\><c-n>
    nnoremap <buffer> <leader>l? :s/\/\/ \?//<cr>:noh<cr>
    nnoremap <buffer> <leader>lz vi{zf
    ab <buffer> clog console.log
    ab <buffer> cerr console.error
endfun
augroup typescript
    autocmd!
    autocmd FileType typescript call s:setTypescriptOptions()
augroup END

let g:syntastic_typescript_checkers = ['tslint']
command! SetTypescriptOptions call s:setTypescriptOptions()



"html stuff
fun! s:setHtmlOptions()
    nnoremap <buffer> <leader>/ I<!--<c-\><c-n>A--><c-\><c-n>
    nnoremap <buffer> <leader>? :s/<!--\\|-->//g<cr>:noh<cr>
endfun
augroup html
    autocmd!
    autocmd FileType html call s:setHtmlOptions()
augroup END

command! SetHtmlOptions call s:setHtmlOptions()
let g:syntastic_html_checkers = ['']

"json stuff
fun! s:setJsonOptions()
    setlocal foldmethod=syntax
endfun
augroup json
    autocmd!
    autocmd FileType json call s:setJsonOptions()
augroup END

command! SetJsonOptions call s:setJsonOptions()

