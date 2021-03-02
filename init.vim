let mapleader=" "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PlugList                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/AppData/Local/nvim/plug')

" coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"comments-auto
Plug 'scrooloose/nerdcommenter'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

"ultisnip
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"theme color
Plug 'yuttie/inkstained-vim' | Plug 'tomasr/molokai' | Plug 'altercation/solarized' | Plug 'crusoexia/vim-monokai'

Plug 'Yggdroot/indentLine'

"Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'

"multiple selections
Plug 'terryma/vim-multiple-cursors'

" emmet quick-html
Plug 'mattn/emmet-vim'

Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'vim-airline/vim-airline'

" Initialize plugin system

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               common setting                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

let g:work='d:/workspace'
let g:self=work."/self/"

function Cw(dir)
  execute ":cd  ".a:dir
endfunction

call Cw(work)


set showcmd
" set background=dark
" set t_Co=256
colorscheme molokai
set number

set autoindent
set smartindent
set showmatch
set ignorecase
set scrolloff=8
set cursorline

set incsearch

set display+=lastline


set tabstop=2
set shiftwidth=2
set expandtab

set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
"set clipboard+=unnamed

set clipboard=unnamed

set winaltkeys=no

set undofile " keep an undo file (undo changes after closing)

set ruler  " show the cursor position all the time

set showcmd " display incomplete commands

set cmdheight=1 " 1 screen lines to use for the command-line

set showfulltag " show tag with function protype.

set guioptions+=b " present the bottom scrollbar when the longest visible line exceed the window

set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936

set encoding=utf-8

set tenc=utf-8

set autoread

set hlsearch

"功能说明:加入或删除注释//
"映射和绑定

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               keyboard-binding                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ch :noh<CR>

nmap <leader>s :update<CR>
vmap <leader>s :update<CR>

nmap <leader>tn :tabnew<cr>
nmap <leader>tc :tabclose<cr>

" 移动分割窗口
nmap <Leader>n <C-w>w
nmap <Leader>m <C-w>m
nmap <Leader>h gT
nmap <Leader>l gt

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>

" 快速保存
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" 创建空行
"nnoremap <Leader>n o<ESC>

"插入模式退出
inoremap jj <ESC>

" 正常模式快速移动
nnoremap <C-j> 3j
nnoremap <C-k> 3k
nnoremap <C-l> 3l
nnoremap <C-h> 3h

" 快速打开config
nnoremap <Leader>tt :e<space>$MYVIMRC<cr>

" 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

" trailling whitespace
nnoremap <leader>d :%s/\s\+$//<cr>:let @/=''<CR>

" easy copy and replace
nnoremap <leader>y "ayiw
nnoremap <leader>v "ap
nnoremap <leader>V viw"ap
vnoremap <leader>v "ap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              plugin settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
" markdown keyboard
" let vim_markdown_preview_hotkey='<C-m>'

"my snippets
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" coc
"coc-snippets

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'
"
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

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




" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nnoremap <leader>f :Format<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')


"ctrlp ####
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'

"nerdcommenter ####
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

"vim-easy-align ####
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)

"vim-jsx ####
" let g:jsx_ext_required = 0

"
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
" let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 开启/关闭nerdtree快捷键
nnoremap <F3> :NERDTreeToggle<CR> 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   others                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Put these in an autocmd group, so that we can delete them easily.

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Disable wrap on some languages
  autocmd BufRead,BufNewFile *.slim setlocal textwidth=0
  autocmd BufRead,BufNewFile *.erb setlocal textwidth=0
  autocmd BufRead,BufNewFile *.html setlocal textwidth=0

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Autocomplete ids and classes in CSS
  autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
  " Add the '-' as a keyword in erb files
  autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-

  " Auto reload VIM when settings changed
  autocmd BufWritePost .vimrc so $MYVIMRC
  autocmd BufWritePost *.vim so $MYVIMRC
  autocmd BufWritePost vimrc.symlink so $MYVIMRC

  " Make those debugger statements painfully obvious
  au BufEnter *.rb syn match error contained "\<binding.pry\>"
  au BufEnter *.rb syn match error contained "\<debugger\>"
  au BufEnter *.js syn match error contained "\<debugger\>"
  au BufEnter *.coffee syn match error contained "\<debugger\>"
augroup END
