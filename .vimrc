" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set autoindent " 创建新行保持与上一行相同的缩进
set smartindent " 智能缩进
set mouse=a
set tabstop=4 " 设置制表符(TAB)的宽度(以空格数量来表示)
set shiftwidth=4 " 设置移位操作 >> 或 << 的缩进长度
set expandtab " 使用空格代替制表符,可能会导致 Python 等依赖于制表符的编程语言出>现问题.

"set noexpandtab " 不要用空格代替制表符
set foldmethod=marker " 使用marker折叠

set number " 显示行号
set autowrite " 自动保存
set ruler " 显示打开状态栏标尺
set cursorline " 突出显示当前行

set showmatch " 匹配光标所经过的括号等.
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式
set hlsearch " 高亮搜索内容的所有匹配位置
set incsearch " 搜索过程中动态显示匹配内容
vmap <C-x> :!pbcopy<CR>
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
"vmap y :w !pbcopy<CR><CR>
"molokai配色
let g:rehash256 = 1
colorscheme molokai
"noremap <C-S-l> <esc>:Autoformat<cr>
noremap af :Autoformat
inoremap <c-l> <esc>
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Chiel92/vim-autoformat'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Yggdroot/indentLine'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on
"
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"set tags+=/Users/momo/Desktop/software/php-src-php-7.2.22/tags
set tags+=/Users/momo/Desktop/software/php-7.0.32/tags

"nerdtree配置
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__', '.idea']
noremap :ntt :NERDTreeToggle<CR> 
""gutentags设置
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
""" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
"
"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

"youcompleteme置
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_collect_indentifier_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_complete_in_comments=1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

set completeopt-=preview "关闭ycm顶部提示窗口
set foldlevelstart=99 "关闭折叠

"nerdcommenter配置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" noremap <C-\/> <leader>c<space>

" Autoformat Autoformat配置
let g:formatdef_my_cpp = '"astyle --style=google --break-after-logical --pad-oper --pad-comma --pad-header --align-pointer=name --align-reference=name --indent-classes --indent=tab=4"'
let g:formatters_cpp = ['my_cpp']
let g:formatters_c = ['my_cpp']

