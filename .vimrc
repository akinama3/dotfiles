" -----------------------------------------------------------------------------
"  初期化
" -----------------------------------------------------------------------------
"  自動コマンド
autocmd!

" vi 互換モードをオフ
set nocompatible

" -----------------------------------------------------------------------------
"  NeoBundle
" -----------------------------------------------------------------------------
" vundle 設定のためオフにする
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/NeoBundle/
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" -----------------------------------------------------------------------------
" NeoBundle plugins
" -----------------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/molokai'
NeoBundle 'vim-scripts/MultipleSearch'
NeoBundle 'surround.vim'
NeoBundle 'joonty/vdebug'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'taku-o/vim-ethna-switch'
NeoBundle 'watanabe0621/aoi-jump.vim'
NeoBundle 'watanabe0621/SmartyJump'
NeoBundle 'vim-scripts/Align'
NeoBundle 'basyura/unite-rails'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'mikehaertl/pdv-standalone'
NeoBundle 'jktgr/vim-json'
NeoBundle 'jktgr/vim-php-ethna-backend.vim'
NeoBundle 'jktgr/smarty.vim'
NeoBundle 'jktgr/phpfolding.vim'
NeoBundle 'jktgr/neosnippet.vim'
NeoBundle 'hk4nsuke/unite-gtags'

" ファイルタイプの自動検出
filetype indent plugin on

" -----------------------------------------------------------------------------
"  Syntax
" -----------------------------------------------------------------------------
syntax on
let g:molokai_original=1
colorscheme molokai

" -----------------------------------------------------------------------------
"  基本設定
" -----------------------------------------------------------------------------
" キーのリマップ
nnoremap [ %

" デフォルトをcommandモードに
set noinsertmode

" 行番号の表示
" set number

" エンコーディング設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

" 基本のインデント設定(各拡張子毎の設定は別途)
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

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

" バックスペースでインデント削除
set backspace=indent,eol,start

" 日本語のズレを無くす
set ambiwidth=double

" バッファを開いた時に、カレントディレクトリを自動で移動
autocmd BufEnter * execute ":lcd " . expand("%:p:h")

" バッファを保存した時にgtags -vを走らせる
autocmd BufWritePost /var/www/1/**/* silent execute "!cd /var/www/1; gtags -v >& /dev/null &"
autocmd BufWritePost /var/www/1/**/* silent execute "!php /var/www/1/Service/Zeta/test/clear_user_cache.php --user_id 2052160 &"

" -----------------------------------------------------------------------------
"  バッファ操作 
" -----------------------------------------------------------------------------
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" -----------------------------------------------------------------------------
"  neocomplete
" -----------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ?  neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" -----------------------------------------------------------------------------
"  neosnippet
" -----------------------------------------------------------------------------
" キーマップの設定
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

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
" インサートモードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_rec_min_cache_files=100
let g:unite_source_rec_max_cache_files=100000
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" ファイル一覧(新規)
noremap <C-U><C-N> :UniteWithBufferDir -buffer-name=files file/new<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :lcd /var/www/1<CR>:Unite buffer file_mru<CR>
" 再帰的にプロジェクトディレクトリを更新
noremap <C-U><C-A> :Unite file_rec:/var/www/1<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

call unite#custom_source('file_rec', 'ignore_pattern', '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|png\|jpg\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)\|\<vendor\>\|\<node_modules\>\|\<data\>\|\<tmp\>\|\<lib\>')

" -----------------------------------------------------------------------------
"  vim-ref
" -----------------------------------------------------------------------------
let g:ref_phpmanual_path = $DOTVIM . '/docs/phpmanual'

" -----------------------------------------------------------------------------
"  unite-gtags.vim
" -----------------------------------------------------------------------------
" grep設定用
nmap <C-g><C-g> :Unite gtags/grep<CR>
" 使用箇所-定義箇所を移動
nmap <C-g><C-j> :Unite gtags/def<CR>
" 定義箇所-使用箇所を移動
nmap <C-g><C-k> :Unite gtags/ref<CR>

" -----------------------------------------------------------------------------
"  unite-locate.vim
" -----------------------------------------------------------------------------
noremap <C-U><C-L> :Unite locate<CR>

" -----------------------------------------------------------------------------
"  Clipboard
" -----------------------------------------------------------------------------
set clipboard=unnamed,autoselect

" -----------------------------------------------------------------------------
"  vdebug
" -----------------------------------------------------------------------------
let g:vdebug_options = {
\    "break_on_open" : 0,
\    "continuous_mode"  : 1,
\}

" -----------------------------------------------------------------------------
"  uniteの色
" -----------------------------------------------------------------------------
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=250 ctermfg=0
highlight PMenuSbar ctermbg=4

" -----------------------------------------------------------------------------
"  php-doc
" -----------------------------------------------------------------------------
autocmd FileType php inoremap <C-@> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-@> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-@> :call PhpDocRange()<CR>
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Copyright = "GREE, Inc."
let g:pdv_cfg_Author = ""
let g:pdv_cfg_License = ""

" After phpDoc standard
let g:pdv_cfg_CommentHead = "/**"
let g:pdv_cfg_Comment1 = " * "
let g:pdv_cfg_Commentn = " *"
let g:pdv_cfg_CommentTail = " */"
let g:pdv_cfg_CommentSingle = "// "

" Attributes settings
let g:pdv_cfg_Uses       = 0
let g:pdv_cfg_php4always = 0
let g:pdv_cfg_php4guess  = 0

" -----------------------------------------------------------------------------
"  MultipleSearch
" -----------------------------------------------------------------------------
nnoremap * :Search <C-R><C-W><CR>
nnoremap + :SearchReset<CR>
let g:MultipleSearchMaxColors = 4

" -----------------------------------------------------------------------------
"  Aoi Jump
" -----------------------------------------------------------------------------
" grep command setting
set grepprg=grep\ -nH

" aoi grep
nnoremap <silent> <space>ag :call AoiGrep()<CR>
" jump to aoi module
nnoremap <silent> <space>am :call AoiModuleJump()<CR>
" jump to aoi processor
nnoremap <silent> <space>ap :call AoiProcessorJump()<CR>
" jump to aoi client
nnoremap <silent> <space>ac :call AoiClientJump()<CR>
" jump to smarty include file
nnoremap <silent> <space>i  :call SmartyJump()<CR>

" -----------------------------------------------------------------------------
"  Unite Rails
" -----------------------------------------------------------------------------
nnoremap <C-u><C-r> :Unite rails/

" -----------------------------------------------------------------------------
"  Vim Ethna Switch & Ethna Backend Switch
" -----------------------------------------------------------------------------
nnoremap <silent> <space>ea :ETA<CR>
nnoremap <silent> <space>et :ETT<CR>
nnoremap <silent> <space>ev :ETV<CR>
nnoremap <silent> <space>bg :EBGenericDao<CR>
nnoremap <silent> <space>bt :EBTdGateway<CR>
nnoremap <silent> <space>bm :EBModule<CR>

" -----------------------------------------------------------------------------
"  PHP Folding
" -----------------------------------------------------------------------------
augroup vimrc
    autocmd FileType phpunit EnableFastPHPFolds
augroup END

" -----------------------------------------------------------------------------
"  PEAR Error check 補完君
" -----------------------------------------------------------------------------
function! PearErrorSnipet()
    let l:cursor_word  = expand("<cword>")
    let l:text = printf("if (PEAR::isError($%s)) {", l:cursor_word)
    exe "norm! o" . l:text
    let l:text = printf("return $%s;", l:cursor_word)
    exe "norm! o" . l:text
    let l:text = "}"
    exe "norm! o" . l:text
endfunction
noremap <silent> <space>p :call PearErrorSnipet()<CR>
