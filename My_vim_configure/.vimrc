""""""""""""""""""""""""""""""""""""VIMRC""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4	"每一级缩进4"

""""""""""""""""""""""""""""""""""""Plugins""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'	 
Plugin 'Xuyuanp/nerdtree-git-plugin'   " 这个插件可以显示文件的Git增删状态
Plugin 'jiangmiao/auto-pairs' 
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

"""""""""""""""""""""""""""""""""""""""Nerdtree""""""""""""""""""""""""""""""""""
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] 
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

""""""""""""""""""""""""""""""YouCompleteMe""""""""""""""""""""""""""""""""""""""""

let g:ycm_confirm_extra_conf=0  


let g:ycm_key_list_previous_completion=['<Down>']  
let g:ycm_key_list_previous_completion=['<Up>']  
let g:ycm_collect_identifiers_from_tags_files=1   
let g:ycm_min_num_of_chars_for_completion=2  
let g:ycm_seed_identifiers_with_syntax=1  


let g:ycm_complete_in_comments=1  
let g:ycm_complete_in_strings=1  
let g:ycm_collect_identifiers_from_comments_and_strings=0  


let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_key_invoke_completion = '<C-a>' " ctrl + a 触发补全
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)"



""""""""""""""""""""""""""powerline""""""""""""""""""""""""""""""""""
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
