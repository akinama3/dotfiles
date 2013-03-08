" -----------------------------------------------------------------------------
"  初期化
" -----------------------------------------------------------------------------
autocmd!

" -----------------------------------------------------------------------------
"  Syntax
" -----------------------------------------------------------------------------
syntax on
colorscheme molokai

" -----------------------------------------------------------------------------
"  基本設定
" -----------------------------------------------------------------------------
" vi 互換モードをオフ
set nocompatible

" キーのリマップ
nnoremap [ %

" デフォルトをcommandモードに
set noinsertmode

" 行番号の表示
set number

" エンコーディング設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

" 基本のインデント設定(各拡張子毎の設定は別途)
set expandtab
set shiftwidth=2
set tabstop=2

" バックアップファイル/スワップファイルを作成しない
set nobackup
set noswapfile

" ステータスラインの表示
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" .vim ディレクトリの設定
let $DOTVIM = expand('~/.vim')

" コマンドライン補完をshellと同一にする 
set wildmode=list:longest

" 検索をインクリメンタルサーチにする
set incsearch

" 検索ワードをハイライトする
set hlsearch

" ケースセンシティブでない検索にする
set ignorecase

" -----------------------------------------------------------------------------
"  vundle
" -----------------------------------------------------------------------------
" vundle 設定のためオフにする
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

" バッファを開いた時に、カレントディレクトリを自動で移動
autocmd BufEnter * execute ":lcd " . expand("%:p:h")

" -----------------------------------------------------------------------------
" vundle plugins
" -----------------------------------------------------------------------------
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimfiler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-ref'
Bundle 'derekwyatt/vim-scala'
Bundle 'tobym/vim-play'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/dbext.vim'
Bundle 'vim-scripts/gtags.vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/phpfolding.vim'
Bundle 'vim-scripts/yanktmp.vim'
Bundle 'vim-scripts/molokai'
Bundle 'surround.vim'

" ファイルタイプの自動検出
" ~/.vim/ftdetect/*.vim によって上書き許可
filetype indent plugin on

" -----------------------------------------------------------------------------
"  バッファ操作 
" -----------------------------------------------------------------------------
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" -----------------------------------------------------------------------------
"  neocomplcache
" -----------------------------------------------------------------------------
" 起動時に有効にする
let g:neocomplcache_enable_at_startup = 1
" ポップアップメニューの候補数
let g:neocomplcache_max_list = 20
" 自動補完を開始する入力数
let g:neocomplcache_auto_completion_start_length = 2
" 大文字小文字の区別
let g:neocomplcache_enable_ignore_case = 1
" アンダーによるあいまい検索
let g:neocomplcache_enable_underbar_completion = 1
" キャメルケースによるあいまい検索
let g:neocomplcache_enable_camel_case_completion = 1
"オムニ補完
augroup SetOmniCompletionSetting
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

" -----------------------------------------------------------------------------
" vim-powerline
" -----------------------------------------------------------------------------
" 256色モード(iTerm2+PowerLineの表示には必要)
set t_Co=256

" かっこいいバー
let g:Powerline_symbols = 'fancy'

" -----------------------------------------------------------------------------
"  unite.vim
" -----------------------------------------------------------------------------
" ノーマルモードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" -----------------------------------------------------------------------------
"  vim-ref
" -----------------------------------------------------------------------------
let g:ref_phpmanual_path = $DOTVIM . '/docs/phpmanual'

" -----------------------------------------------------------------------------
"  dbext
" -----------------------------------------------------------------------------
let dbext_default_profile=""
let dbext_default_type="MYSQL"
let dbext_default_user="root"
let dbext_default_passwd=""
let dbext_default_dbname=""
let dbext_default_host="localhost"
let dbext_default_buffer_lines=20

" -----------------------------------------------------------------------------
"  gtags.vim
" -----------------------------------------------------------------------------
" grep設定用
nmap <C-g><C-g> :Gtags -g
" ファイル中で定義されている関数一覧表示
nmap <C-g><C-f> :Gtags -f %<CR>
" 定義箇所-使用箇所を移動
nmap <C-g><C-j> :Gtags <C-r><C-w><CR>
" 使用箇所-定義箇所を移動
nmap <C-g><C-k> :Gtags -r <C-r><C-w><CR>
" カーソル位置の関数へ移動
nmap <C-g><C-i> :GtagsCursor<CR>
" 検索結果を閉じる
nmap <C-c> <C-w><C-w><C-w>q

" -----------------------------------------------------------------------------
"  phpfolding
" -----------------------------------------------------------------------------
" PHP以外にもfoldingを適用
augroup vimrc
    autocmd FileType phpunit EnableFastPHPFolds
augroup END

" -----------------------------------------------------------------------------
" vimfiler
" -----------------------------------------------------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
nmap <C-u><C-v> :VimFiler -buffer-name=explorer -split -simple -winwidth=40 -no-quit<CR>

" -----------------------------------------------------------------------------
" User Functions
" -----------------------------------------------------------------------------
" PEAR Error Snipet
function! PearErrorSnipet()
    let l:cursor_word  = expand("<cword>")

    let l:text = printf("if (PEAR::isError($err = $%s)) {", l:cursor_word)
    exe "norm! o" . l:text
    let l:text = "return $err;"
    exe "norm! o" . l:text
    let l:text = "}" 
    exe "norm! o" . l:text
endfunction
noremap <silent> <space>p :call PearErrorSnipet()<CR>


" -----------------------------------------------------------------------------
"  YankTmp
" -----------------------------------------------------------------------------
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 
