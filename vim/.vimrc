"""""""""""""""""""""""""""""""VIMRC"""""""""""""""""""""""""""""""""

iabbrev @@ 	laohan1221@126.com 
iabbrev ccopy Copyright 2018 Leon Cheng, all rights reserved.
set tabstop=4
set shiftwidth=4	"每一级缩进4"
set shortmess+=c	"To solve the problem "user difined completion"	

set nu 
set ic
" noremap <F9> = :r !date <CR> I### <esc>o<CR>
autocmd FileType markdown noremap <F9> = :r !date <CR> I### <esc> z<CR> o<CR>
autocmd FileType markdown noremap <leader>9 = :r !date <CR> I### <esc> z<CR> o<CR>

" 7 compile without execute
" 8 compile and execute(for python just execute)
" 9 make and execute
" 10 make without execute
autocmd FileType cpp nnoremap <buffer> <F9> :w<Bar> !make && ./Main.out <CR><CR>
" autocmd FileType cpp nnoremap <buffer> <leader>9 :w<Bar>!make && ./Main.out<CR>
" don't know the meaning of <Bar>
autocmd FileType cpp nnoremap <buffer> <leader>9 :w<Bar> !make && ./Main.out<CR>
autocmd FileType cpp nnoremap <buffer> <F10> :w<Bar> !make <CR>
autocmd FileType cpp nnoremap <buffer> <leader>0 :w<Bar>!make <CR>

autocmd FileType cpp nnoremap <buffer> <F7> :w<Bar>!g++ -g % -o %:r.out -std=c++14<CR><CR>
autocmd FileType cpp nnoremap <buffer> <leader>7 :w<Bar>!g++ -g % -o %:r.out -std=c++14<CR><CR>
autocmd FileType cpp nnoremap <buffer> <F8> :w<Bar>!g++ -g % -o %:r.out -std=c++14 && ./%:r.out<CR>
autocmd FileType cpp nnoremap <buffer> <leader>8 :w<Bar>!g++ -g % -o %:r.out -std=c++14 && ./%:r.out<CR>
autocmd FileType python nnoremap <buffer> <leader>8 :w<Bar>!python %:r.py<CR>


" Make F9 to fixit by ycm diagnostic
" autocmd filetype cpp nnoremap <buffer> <F9> :YcmCompleter FixIt<CR>

" Head of Shell script
autocmd bufnewfile *.sh 0r /home/leon/.vim/sh_header.temp

" Make space more useful
"nnoremap <space> za
inoremap <c-d> <esc>ddO
let mapleader = ","
"let maplocalleader = "\\"
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <c-e> <c-u>
nnoremap <c-u> <c-e>
autocmd FileType cpp nnoremap <leader>m :YcmCompleter GoTo<CR>

""""""""""""""""""""""""""" Octave syntax """"""""""""""""""""""""""
augroup filetypedetect
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END



"""""""""""""""""""""""""""""""""" Vundle """"""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'	 
Plugin 'Xuyuanp/nerdtree-git-plugin'   " 这个插件可以显示文件的Git增删状态
Plugin 'jiangmiao/auto-pairs' 
Plugin 'Valloric/ListToggle'			" locationlist ---> <leader>l
										" quickfixlist ---> <leader>q
Plugin 'Valloric/YouCompleteMe'


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'JamshedVesuna/vim-markdown-preview'

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

"""""""""""""""""""""""""rpowerline""""""""""""""""""""""""""""""""""
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

""""""""""""""""""""""""""" YouCompleteMe """"""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'


" To make youcompleteme support c++14
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_cpp_checkers = 'gcc'
" let g:syntastic_cpp_compliler_options = '-std=c++14'

let g:ycm_key_list_previous_completion=['<Down>']  
let g:ycm_key_list_previous_completion=['<Up>']  
let g:ycm_collect_identifiers_from_tags_files=1   

" If the value is 99 and the next option is 1, it acts like turn off the identifier compeler and keep the sematics triggers(. and ->) on.
let g:ycm_min_num_of_chars_for_completion=4 

" When set 0, Turn off identifier completer and the sematics triggers 
let g:ycm_auto_trigger = 1


let g:ycm_complete_in_comments=1  
let g:ycm_complete_in_strings=1  
let g:ycm_collect_identifiers_from_comments_and_strings=0  
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全


let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置


let g:ycm_key_invoke_completion = '<C-a>' " ctrl + a 触发补全
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)"

"let ycm disabled in specified filetype, the value is unimportant, if you want remove a option, just delete the line; 
"\ 'markdown':1,
let g:ycm_filetype_blacklist={ 
	\ 'qf' : 1,
	\ 'notes' : 1, 
	\ 'tagbar' : 1,
	\ 'unite' : 1,
	\ 'text' : 1,
	\ 'vimwiki' : 1,
	\ 'pandoc' : 1,
	\ 'infolog' : 1,
	\ 'mail' : 1
	\}

" gutter sign, text highlighting, diagnostic echo, auto location list
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0			"diagnostics sign on
let g:ycm_enable_diagnostic_highlighting = 0	"hightlighting off
let g:ycm_echo_current_diagnostic = 1
let g:ycm_warning_symbol = '>'
let g:ycm_error_symbol = '>>'
let g:ycm_always_populate_location_list=1

"let diagnostics do not show the unused variable information
let g:ycm_filter_diagnostics = {
  \ "cpp": {
  \      "regex": [ "unused variable *", "unused parameter *" ],
  \      "level": "warning",
  \    }
  \ }



"""""""""""""""""""""""""" vim-markdown-preview """""""""""""""""""
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=0
let vim_markdown_preview_browser='Mozilla Firefox'
" browser_wid = system("xdotool search --name 'vim-markdown-preview.html'")


"""""""""""""""""""""""" Special Problem """"""""""""""""""""""""""
" Problem 1:
" User defined completion (^U^N^P) Back at original.
" set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Concealing, such as **/_/link-string/etc
set conceallevel=2


""""""""""""""""""""""""""" plasticboy/vim-markdown """""""""""""""
let g:vim_markdown_json_frontmatter = 0
