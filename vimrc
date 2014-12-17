" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
   source ~/.vimrc.bundles
endif

let mapleader = ','
let g:mapleader = ','


set number "�����к�
syntax on "�﷨����

set backspace=indent,eol,start
set autoindent "�Զ�����
set smartindent   " Smart indent
set tabstop=4 "tab Ϊ4 
set shiftwidth=4 " ÿһ��������Ӧ�Ŀո���
set expandtab     " ��Tab�Զ�ת���ɿո�    [��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
set shiftround    " ����ʱ��ȡ�� use multiple of shiftwidth when indenting with '<' and '>'
set smarttab "����tab
set showmatch "��ʾ�Զ�ƥ��()[]
set history=2000 "��ʷ����
set background=dark "����ɫ
set ruler "�򿪹���
set clipboard+=unnamed   "����繲��ճ��������
set autowrite   "�Զ�����
"set cursorline  "��ʾ���������
set foldenable   "���������۵�
set foldlevel=4   "�۵����4��
set foldmethod=indent  "�۵���ʽΪ����
set foldcolumn=0
set autoread          " �ļ��޸�֮���Զ���

"create undo file
if has ('presistent_undo')
    set undolevels=1000
    set undoreload=10000
    set undofile
    set undodir=/tmp/vimundo
endif

"���� �˳�vim��������ʾ���ն���Ļ, �������ڲ鿴�͸���
"�ô�����ɾʲô�ģ������ǰ��Ļ�򿪣������һ�
set t_ti= t_te=

" ���½���ʾ��ǰvimģʽ
set showmode

""��״̬����ʾ�������������
set showcmd

"������������������ʾ
"����search���е��ı�
set hlsearch
" ����������ģʽ,���ż��뼴ʱ����
set incsearch

" ����ʱ���Դ�Сд
set ignorecase
" ��һ�������ϴ�д��ĸʱ�Դ�Сд����
set smartcase 

autocmd! bufwritepost .vimrc source % " vimrc�ļ��޸�֮���Զ����ء� linux

" �Զ���ȫ����
" "��Vim�Ĳ�ȫ�˵���Ϊ��һ��IDEһ��(�ο�VimTip1228)
set completeopt=longest,menu

"F2 ����/�ر��к�
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
" ��������Use sane regexes"
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
" ȥ����������
noremap <silent><leader>/ :nohls<CR>

" --------tab/buffer���
"Use arrow key to change buffer"
" TODO: �����ת��ȷ����buffer?
" :b1 :b2   :bf :bl
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>


" tab ����
" TODO: ctrl + n ����л�tab�ķ���
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" �½�tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" normalģʽ���л���ȷ�е�tab
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

"��ֹ����
let &termencoding=&encoding
set fileencodings=utf-8,gbk,utf-16,big5
