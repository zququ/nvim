"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/

" Todos
" - pylint reports error when doing `vim ~/Github/vim-calc/build-up/calc.py`
"   instead of doing `cd ~/Github/vim-calc/build-up` and then do `vim calc.py`
" - hotkey to switch between light theme and dark theme (in progress, still
"   some bugs
"
"
"   Testing
"fnew
"call nvim_win_float_set_pos(0,5,10,20,5)
"hi Floating guibg=#00044
"set withhl=Normal:Floating


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
"let has_machine_specific_file = 1
"if empty(glob('~/.config/nvim/_machine_specific.vim'))
"	let has_machine_specific_file = 0
"	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
"endif
"source ~/.config/nvim/_machine_specific.vim

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif

set colorcolumn=80
set updatetime=1000
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Cursor shape
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>:q<CR>
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0   = '#000000'
let g:terminal_color_1   = '#FF5555'
let g:terminal_color_2   = '#50FA7B'
let g:terminal_color_3   = '#F1FA8C'
let g:terminal_color_4   = '#BD93F9'
let g:terminal_color_5   = '#FF79C6'
let g:terminal_color_6   = '#8BE9FD'
let g:terminal_color_7   = '#BFBFBF'
let g:terminal_color_8   = '#4D4D4D'
let g:terminal_color_9   = '#FF6E67'
let g:terminal_color_10  = '#5AF78E'
let g:terminal_color_11  = '#F4F99D'
let g:terminal_color_12  = '#CAA9FA'
let g:terminal_color_13  = '#FF92D0'
let g:terminal_color_14  = '#9AEDFE'


" ===
" === Status bar behaviors
" ===
"set noshowmode
"set showcmd
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
"set wildmenu

" Searching options
"exec "nohlsearch"
"set ignorecase
"set smartcase


" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
map ; :

" Save & quit
map Q :q<CR>
map S :w<CR>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

"Undo operations
noremap h u

" Undo in Insert mode
inoremap <C-h> <C-u>

" Insert Key
noremap u i
noremap U I

" make Y to copy till the endo of the line
nnoremap Y y$
"" Copy to system clipboard
noremap Y "+y

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Folding
map <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===
"
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     k 
" < h   l >
"     j 
"     v
noremap i k
noremap j h
noremap k j
noremap l l
" U/E keys for 5 times u/e (faster navigation)
noremap I 5k
noremap K 5j
" N key: go to the start of the line
noremap N 0
" I key: go to the end of the line
noremap M $

" Faster in-line navigation
noremap W 5w
noremap B 5b
" set h (same as n, cursor left) to 'end of word'
noremap y e

" Ctrl + U or Y will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
"inoremap <C-U> <Esc>5<C-y>a
"inoremap <C-E> <Esc>5<C-e>a


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sk :set splitbelow<CR>:split<CR>
map sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
"noremap sh <C-w>t<C-w>K
" Place the two screens side by side
"noremap sv <C-w>t<C-w>H

" Rotate screens
"noremap srh <C-w>b<C-w>K
"noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tj and tl
map tj :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmj and tml
map tmj :-tabmove<CR>
map tml :+tabmove<CR>

" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
map ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    :vsp
    :vertical resize-20
    :term python3 %
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'


" Pretty Dress
Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'
"Plug 'liuchengxu/space-vim-theme'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-one'
"Plug 'mhartington/oceanic-next'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ajmwagar/vim-deus'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf'
Plug 'francoiscabrol/ranger.vim'


" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive' " gv dependency
Plug 'junegunn/gv.vim' " gv (normal) to show git log
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" Tex
Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript' ", { 'for' :['javascript', 'vim-plug'] }
Plug 'jelera/vim-javascript-syntax'

" Go
Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

" Python
Plug 'tmhedberg/SimpylFold'
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'theniceboy/bullets.vim'

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'

" Formatter
Plug 'Chiel92/vim-autoformat'

" For general writing
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Find & Replace
Plug 'wsdjeg/FlyGrep.vim' " Ctrl+f (normal) to find file content
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Documentation
Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
"Plug 'voldikss/vim-floaterm'
"Plug 'liuchengxu/vim-clap'
"Plug 'jceb/vim-orgmode'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'

" Other useful utilities
Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim

call plug#end()

" experimental
"set lazyredraw
"set regexpengine=1

" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
        let has_machine_specific_file = 0
        silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

"" ===
"" === ICONS
"" ===
"set encoding=UTF-8
" not need to change the encoding in neo-vim, default to UTF-8

" ===
" === Dress up my vim
" ===
"set termguicolors     " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"set background=light

let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1


"color deus
color gruvbox
"let ayucolor="light"
"color ayu

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===
" === Airline
" ===

let g:airline_powerline_fonts = 1

" ===
" === NERDTree
" ===
noremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "U"
let NERDTreeMapActivateNode = "u"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"

" ==
" == GitGutter
" ==
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>
let g:gitgutter_max_signs = 1000

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"" ===
"" === NCM2  not used
"" ===
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"let ncm2#popup_delay = 5
"let g:ncm2#matcher = "substrfuzzy"
"let g:ncm2_jedi#python_version = 3
"let g:ncm2#match_highlight = 'sans-serif'

"let g:jedi#auto_initialization = 1
""let g:jedi#completion_enabled = 0
""let g:jedi#auto_vim_configuration = 0
""let g:jedi#smart_auto_mapping = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completion_command = ""
"let g:jedi#show_call_signatures = "1"


" ===
" === coc
" ===
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nmap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" pylint to coc
let g:neomake_python_enabled_makers = ['pylint']

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === some error checking
" ===

let g:ale_virtualtext_cursor = 1
let g:ale_linters = {
			\ 'cs': ['OmniSharp'],
			\ 'go': ['vim-go'],
			\ 'c' : ['ccls']
			\}
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }
let g:ale_c_gcc_executable = '/usr/bin/gcc'
"let g:ale_c_gcc_options="-Wall -O2"

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === FZF
" ===
noremap <C-p> :FZF<CR>

" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
  \ }


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
noremap H :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" ===
" === Far.vim
" ===
noremap <LEADER>fa :F	%<left><left>
noremap <LEADER>fr :Farp<CR>

" ===
" === Bullets.vim
" ===
"let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" ===
" === Vista.vim
" ===

noremap <silent> T :Vista!!<CR>
noremap <silent> <C-t> :Vista finder<CR>
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
"
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
"" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:

let g:vista_fzf_preview = ['right:50%']

"" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

"" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
"let g:vista#renderer#icons = {
"\   "autocommand groups": "\U279A",
"\            "functions": "\U279A",
"\            "variables": "\U279A",
"\                 "maps": "\U279A",
"\              "classes": "\U279A",
"\              "members": "\U279A",
"\  }

" ===
" === Ranger.vim
" ===
nnoremap R :Ranger<CR>
let g:ranger_map_keys = 0

" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>

" ===
" === Ultisnips
" ===
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let maplocalleader=' '


" ===
" === FlyGrep
" ===
nnoremap <c-f> :FlyGrep<CR>


" ===
" === GV
" ===
nnoremap gv :GV<CR>


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === Anzu
" ===
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N


" ===
" === vim-go
" ===
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
"let g:go_def_mapping_enabled = 1
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types                     = 1
let g:go_highlight_variable_assignments      = 0
let g:go_highlight_variable_declarations     = 0


" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>

" ===
" === OmniSharp
" ===
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
	autocmd!
	autocmd FileType cs set signcolumn=yes
	autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
	if !OmniSharp#IsServerRunning() | return | endif
	let opts = {
				\ 'CallbackCount': function('s:CBReturnCount'),
				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
				\}
	call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
	if a:count
		let l = getpos('.')[1]
		let f = expand('%:p')
		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
	endif
endfunction


" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1


" ===
" === vim-floaterm
" ===
"nnoremap ? :FloatermToggle<CR>
"let g:floaterm_position = 'center'
"let g:floaterm_winblend = 20
"let g:floaterm_height = winheight(0)/3*2
"let g:floaterm_width = &columns/3*2


" ===
" === vim-clap
" ===
""nnoremap ,c :Clap bcommits<CR>
""nnoremap ,l :Clap blines<CR>
"nnoremap ,b :Clap buffers<CR>
"nnoremap ,C :Clap colors<CR>
""nnoremap ,h :Clap hist<CR>
"nnoremap ,c :Clap commits<CR>
""nnoremap ,f :Clap files<CR>
"nnoremap ,t :Clap filetypes<CR>
"nnoremap ,g :Clap gfiles<CR>
""nnoremap , :Clap grep<CR>
""nnoremap ,a :Clap jumps<CR>
""nnoremap , :Clap marks<CR>
""nnoremap ,t :Clap tags<CR>
"nnoremap ,w :Clap window<CR>


" ===
" === vim-easymotion
" ===
let g:EasyMotion_smartcase = 1
" 'f{char} to move to {char}
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
map \; <Plug>(easymotion-prefix)
" 's{char}{char} to move to {char}{char}
"nmap 's <Plug>(easymotion-overwin-f2)
" Move to line
"map 'l <Plug>(easymotion-bd-jk)
"nmap 'l <Plug>(easymotion-overwin-line)
" Move to word
"map  'w <Plug>(easymotion-bd-w)
"nmap 'w <Plug>(easymotion-overwin-w)

" ===
" === eleline
" ===

let g:eleline_powerline_fonts = 1
"
""To make the eleline simpler
"let g:eleline_slim = 1

  "===
  "=== lightine
  "===

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" ===================== End of Plugin Settings =====================

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif


"let g:user_emmet_leader_key='<C-f>'
"" Open the _machine_specific.vim file if it has just been created
"if has_machine_specific_file == 0
  "exec "e ~/.config/nvim/_machine_specific.vim"
"endif

"if $TERM_PROGRAM == "iTerm.app" || has("gui_vimr")
  "set termguicolors
  "colorscheme material-theme
  "set background=dark
"else
  "set background=dark
"endif

let g:python3_host_prog='/usr/local/bin/python3'
