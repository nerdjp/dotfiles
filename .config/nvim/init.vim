"==========================================================
"
"
"   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"
"   To learn more about how to configure Neovim
"   go to https://github.com/polybar/polybar
"
"   The README contains a lot of information
"
"==========================================================

	"Installing plugins
	call plug#begin('~/.config/nvim/plugged')

	"Status bar
	Plug 'itchyny/lightline.vim'

	"Code Completion
	"Plug 'neovim/nvim-lspconfig'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	
	"NERDTree files
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	"Commentary
	Plug 'tpope/vim-commentary'
	
	"Moving around at the speed of sound
	Plug 'easymotion/vim-easymotion'

	"Highlights
	Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
	
	" Themes
	Plug 'nekonako/xresources-nvim'
	Plug 'arcticicestudio/nord-vim'
	Plug 'joshdick/onedark.vim'
	Plug 'mhinz/vim-startify'
	Plug 'dracula/vim', { 'as': 'dracula' }

	call plug#end()
	
	"Basic settins
	syntax on
	set number relativenumber
	set noshowmode
	set cursorline
	set updatetime=300
	set path=.,,**
	
	"Map leader to space
	let mapleader =" "

	"Theme
	set background=dark
	set termguicolors
	colorscheme onedark
	"colorscheme xresources
	hi! Normal ctermbg=NONE guibg=NONE
	hi! NonText ctermbg=NONE guibg=NONE
	let g:lightline = { 'colorscheme': 'onedark' }

	"Map leader + s and v/h to open split 
	nmap <leader>sv :sp<space>
	nmap <leader>sh :vsp<space>

	nmap <leader>tt :tabnew<space>
	nmap <leader>tf :tabfind<space>
	nmap <leader>te :tabedit<space>

	"Fix split spaw location
	set splitbelow splitright

	"Keymaps for splits
	nmap <C-h> :tabprevious<Enter>
	nmap <C-j> :tabprevious<Enter>
	nmap <C-k> :tabnext<Enter>
	nmap <C-l> :tabnext<Enter>

	"Keep visual selection after indentation
	vmap < <gv
	vmap > >gv
	
	"Fix Shift+Y to work like Shift+C
	nmap Y y$

	"Allow moving with hjkl in insert mode while holding control
	imap <C-h> <Left>
	imap <C-j> <Down>
	imap <C-k> <Up>
	imap <C-l> <Right>


	"Autocmd for when editing some configs
	" autocmd BufWritePost ~/dev/dwmblocks/blocks.h !sudo make clean install && killall dwmblocks && setsid dwmblocks &
	" autocmd BufWritePost ~/.config/polybar/config !.config/polybar/./polybar.sh
	autocmd BufWritePost ~/.config/i3/config !i3-msg -q reload 

	"Configuring startify
	"Set startify header - Font: Slant - https://www.coolgenerator.com/ascii-text-generator - See also ( Speed - Standard and the ones at the begining)
	let g:startify_custom_header = [
	    \' 						 ',
	    \'        _   ____________ _    ________  ___',
	    \'       / | / / ____/ __ \ |  / /  _/  |/  /',
	    \'      /  |/ / __/ / / / / | / // // /|_/ / ',
	    \'     / /|  / /___/ /_/ /| |/ // // /  / /  ',
	    \'    /_/ |_/_____/\____/ |___/___/_/  /_/   ',
	    \' 						 ',
	    \ ]

	"Configuring NERDTree
	"NERDTree Keymaps
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTreeToggle<CR>
	nnoremap <C-f> :NERDTreeFind<CR>

	" Start NERDTree and put the cursor back in the other window.
	" autocmd VimEnter * NERDTree | wincmd p

	 " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

	" Exit Vim if NERDTree is the only window left.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	    \ quit | endif

	" Configuring CoC
	" Setting CoC extensions
	let g:coc_global_extensions = [
		\ 'coc-snippets',
		\ 'coc-pairs',
		\ 'coc-prettier',
		\ 'coc-tsserver',
		\ 'coc-html',
		\ 'coc-css',
		\ 'coc-json',
		\ 'coc-sh',
		\ 'coc-yaml',
		\ 'coc-vimtex',
		\ ]
	
	" Use tab for trigger completion with characters ahead and navigate.
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
  		let col = col('.') - 1
  		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <C-space> to trigger completion.
	inoremap <silent><expr> <C-space> coc#refresh()

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

	"Configuring Hexokinase color mode
	let g:Hexokinase_highlighters = ['virtual']
