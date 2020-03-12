"
" GRAHAM's VIM CCONFIGURATION
" 
set nocompatible 	" Be modern vim, not vi
set number		" enable line numbers
set linebreak		" break at word
set showbreak=+++	" wrap-broken line prefix
set showmatch		" show matching braces
set errorbells		" beep/flash screen
set visualbell		"
set hlsearch		" highlight all search results
set smartcase		" smart case-search
set ignorecase		" ignore case in search
set incsearch		" incremental search
syntax on		" syntax highlighting
set ruler
filetype plugin on
filetype plugin indent on
set modelines=0 
set wrap

" Copy/Pasting from clipboard
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>>:set invpaste paste?<CR>
set pastetoggle=<F2>

set laststatus=2
set showmode
set showcmd
set matchpairs+=<:>		" html/javascript
set cursorline

" allow per-project .vimrc
set exrc
set secure

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"
" Fuzzy search
" Search down into subfolders
set path+=**
set wildmenu

"
" Theme
" 
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatusLineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline+=%{StatusLineGit()}

"
" Filetype based formatting
"
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.s set filetype=m68k
