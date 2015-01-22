let mapleader = ','
let g:mapleader = ','
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
   source ~/.vimrc.bundles
endif



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
"set foldenable   "���������۵�
"set foldlevel=4   "�۵����4��
"set foldmethod=indent  "�۵���ʽΪ����
"set foldcolumn=0
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

"nnoremap <F3> :set list! list?<CR>
map <F3> :silent! Tlist<CR>
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
"set background=light
colorscheme default
set t_Co=256

"��ֹ����
"let &termencoding=&encoding
"set fileencodings=utf-8,gbk,utf-16,big5
