" General Vim settings
	syntax on
	let mapleader=","
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set dir=/tmp/
	set relativenumber 
	set number

	autocmd Filetype html setlocal sw=2 expandtab
	autocmd Filetype javascript setlocal sw=4 expandtab

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start
	set whichwrap+=<,>,h,l

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" Allow saving of files as sudo when I forgot to start vim using sudo.
	cmap w!! w !sudo tee > /dev/null %

" Make those folders automatically if they don't already exist.
	if !isdirectory(expand(&undodir))
			call mkdir(expand(&undodir), "p")
	endif
	if !isdirectory(expand(&backupdir))
			call mkdir(expand(&backupdir), "p")
	endif
	if !isdirectory(expand(&directory))
			call mkdir(expand(&directory), "p")
	endif

" Resize splits when the window is resized
	au VimResized * :wincmd =

	set modelines=1
	set showmode
	set history=700
	set undofile
	set undoreload=10000
	set matchtime=3
	set splitbelow
	set splitright
	set autowrite
	set autoread
	set shiftround
	set title
	set linebreak
	set colorcolumn=+1

" Enable filetype plugins
	filetype plugin on
	filetype indent on

"Always show current position
	set ruler

"Clipboard stuff
	set clipboard=unnamedplus

" Height of the command bar
	set cmdheight=2

" Ignore case when searching
	set ignorecase

" When searching try to be smart about cases
	set smartcase

" Highlight search results
	set hlsearch

" Makes search act like search in modern browsers
	set incsearch

" Don't redraw while executing macros (good performance config)
	set lazyredraw

" For regular expressions turn magic on
	set magic

" Show matching brackets when text indicator is over them
	set showmatch

" No annoying sound on errors
	set noerrorbells
	set novisualbell
	set t_vb=

" Language Specific
	" Tabs
		so ~/dotfiles/vim/sleuth.vim

	" Typescript
		autocmd BufNewFile,BufRead *.ts set syntax=javascript
		autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>


" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Auto load
	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
	set autoread 
	" Notification after file change
	" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
	autocmd FileChangedShellPost *
		\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Future stuff
	"Swap line
	"Insert blank below and above

" Fix for: https://github.com/fatih/vim-go/issues/1509

filetype plugin indent on
