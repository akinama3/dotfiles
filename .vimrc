" -----------------------------------------------------------------------------
"  初期化
" -----------------------------------------------------------------------------
autocmd!

" -----------------------------------------------------------------------------
"  colorscheme
" -----------------------------------------------------------------------------
syntax on
colorscheme gentooish

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

" エンコーディング設定(utf-8)
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp

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

" -----------------------------------------------------------------------------
"  vundle
" -----------------------------------------------------------------------------
" vundle 設定のためオフにする
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

" -----------------------------------------------------------------------------
" vundle plugins
" -----------------------------------------------------------------------------
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/phpfolding.vim'
Bundle 'thinca/vim-ref'
Bundle 'derekwyatt/vim-scala'
Bundle 'tobym/vim-play'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/dbext.vim'

" ファイルタイプの自動検出
" ~/.vim/ftdetect/*.vim によって上書き許可
filetype indent plugin on

" -----------------------------------------------------------------------------
"  minibufexpl 
" -----------------------------------------------------------------------------
" バッファ操作を<C-n><C-p>で行えるようにする
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
if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
else
  set t_Co=16
endif
" かっこ良くする
let g:Powerline_symbols = 'fancy'

" -----------------------------------------------------------------------------
"  unite.vim
" -----------------------------------------------------------------------------
" 入力モードで開始する
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
