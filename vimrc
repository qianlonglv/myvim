" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
   source ~/.vimrc.bundles
endif

let mapleader = ','
let g:mapleader = ','


set number "开启行号
syntax on "语法高亮

set backspace=indent,eol,start
set autoindent "自动缩进
set smartindent   " Smart indent
set tabstop=4 "tab 为4 
set shiftwidth=4 " 每一次缩进对应的空格数
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set smarttab "智能tab
set showmatch "显示自动匹配()[]
set history=2000 "历史记忆
set background=dark "背景色
set ruler "打开光标尺
set clipboard+=unnamed   "和外界共享粘贴板内容
set autowrite   "自动保存
"set cursorline  "显示光标所在行
set foldenable   "开启代码折叠
set foldlevel=4   "折叠最大4层
set foldmethod=indent  "折叠方式为缩进
set foldcolumn=0
set autoread          " 文件修改之后自动载

"create undo file
if has ('presistent_undo')
    set undolevels=1000
    set undoreload=10000
    set undofile
    set undodir=/tmp/vimundo
endif

"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 左下角显示当前vim模式
set showmode

""在状态栏显示正在输入的命令
set showcmd

"设置文内智能搜索提示
"高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch

" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase 

autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux

" 自动补全配置
" "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

"F2 开启/关闭行号
function! HideNumber()
    if(@relativenumber == &number)
        set relativenumber! number
    elseif(&number)
        set number;
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>

set pastetoggle=<F5>
au InsertLeave * set nopaste

nnoremap <F6> :exec exists('syntax_on')?'syn off' : 'syn on'<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" switch # *
nnoremap # *
nnoremap * #
" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" --------tab/buffer相关
"Use arrow key to change buffer"
" TODO: 如何跳转到确定的buffer?
" :b1 :b2   :bf :bl
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>


" tab 操作
" TODO: ctrl + n 变成切换tab的方法
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
let g:last_active_tab = 1
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()


if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12, Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guioptions=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

set background=dark
colorscheme molokai
set t_Co=256

"防止乱码
let &termencoding=&encoding
set fileencodings=utf-8,gbk,utf-16,big5
