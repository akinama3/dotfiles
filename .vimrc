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
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle "Shougo/unite-outline"
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'bling/vim-airline'
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
NeoBundle 'akinama/vim-json'
NeoBundle 'akinama/vim-php-ethna-backend.vim'
NeoBundle 'akinama/phpcomplete.vim'
NeoBundle 'akinama/smarty.vim'
NeoBundle 'akinama/phpfolding.vim'
NeoBundle 'hk4nsuke/unite-gtags'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'gre/play2vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-rake'

" C# OmniComplete
NeoBundleLazy 'nosami/Omnisharp', {
      \  'autoload': {'filetypes': ['cs']},
      \  'build': {
      \    'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
      \    'mac': 'xbuild server/OmniSharp.sln',
      \    'unix': 'xbuild server/OmniSharp.sln',
      \  }
      \}


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
set shiftwidth=2
set tabstop=2
set softtabstop=2

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
" autocmd BufEnter * execute ":lcd " . expand("%:p:h")

" バッファを保存した時にgtags -qを走らせる
" 環境に合わせてsourceするようにする(リポジトリには含めない)
" autocmd BufWritePost /var/www/1/**/* silent execute '!cd /var/www/1; gtags -q /mnt/ramdisk >& /dev/null &'
source ~/.vimrc.local

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
" Use Underbar Completion
let g:neocomplete#enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Use Vimproc
let g:neocomplete#use_vimproc = 1
" Lock Buffer Name Pattern
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Enable Prefetch
let g:neocomplete#enable_prefetch = 1

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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Enable php completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" inoremap <expr><C-o> neocomplete#start_manual_complete('omni')

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
" vim-airline
" -----------------------------------------------------------------------------
" 256色モード(iTerm2+PowerLineの表示には必要)
set t_Co=256

" かっこいいバー
let g:airline_theme = 'light'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = "⮃"
let g:airline#extension#branch#symbol = '⭠'
let g:airline_detect_whitespace = 0
let g:airline_theme = 'dark'

" -----------------------------------------------------------------------------
"  unite.vim
" -----------------------------------------------------------------------------
" インサートモードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_rec_min_cache_files=100
let g:unite_source_rec_max_cache_files=100000
let g:unite_source_file_mru_limit=10000
let g:unite_enable_ignore_case=1
" Unite Grep the silver searcher
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file file/new<CR>
" ファイル一覧(新規)
noremap <C-U><C-N> :UniteWithBufferDir -buffer-name=files file/new<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 再帰的にプロジェクトディレクトリを更新
noremap <C-U><C-A> :Unite file_rec:.<CR>
" アウトライン
noremap <C-U><C-O> :Unite -vertical -no-quit outline<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

call unite#custom_source(
            \ 'file_rec', 
            \ 'ignore_pattern',
            \ '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|png\|jpg\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)\|\<vendor\>\|\<node_modules\>\|\<htdocs\>\|\<tmp\>\|\<lib\>')

" -----------------------------------------------------------------------------
"  vim-ref
" -----------------------------------------------------------------------------
let g:ref_phpmanual_path = $DOTVIM . '/docs/phpmanual'
nnoremap <silent> <space>ref :Unite ref/phpmanual<CR>

" Ruby
let g:ref_use_vimproc=1
let g:ref_refe_version=2
let g:ref_refe_encoding='utf-8'

" -----------------------------------------------------------------------------
"  unite-gtags.vim
" -----------------------------------------------------------------------------
" grep設定用
nmap <C-G><C-G> :Unite gtags/grep<CR>
" 使用箇所-定義箇所を移動
nmap <C-G><C-J> :Unite gtags/def<CR>
" 定義箇所-使用箇所を移動
nmap <C-G><C-K> :Unite gtags/ref<CR>

" -----------------------------------------------------------------------------
"  unite-locate.vim
" -----------------------------------------------------------------------------
noremap <silent> <space>ul :Unite locate<CR>

" -----------------------------------------------------------------------------
"  Clipboard
" -----------------------------------------------------------------------------
set clipboard=unnamed,autoselect

" -----------------------------------------------------------------------------
"  vdebug
" -----------------------------------------------------------------------------
let g:vdebug_options = {
\    "port" : 9001,
\    "break_on_open" : 0,
\    "continuous_mode"  : 1,
\    'server': '0.0.0.0',
\    "path_maps" : {'/vagrant/source' : '/Users/katagiri/Vagrant/hakoniwa/source'}
\}

" -----------------------------------------------------------------------------
"  uniteの色
" -----------------------------------------------------------------------------
highlight PmenuSel ctermbg=13 ctermfg=7

" -----------------------------------------------------------------------------
"  php-doc
" -----------------------------------------------------------------------------
autocmd FileType php inoremap <C-@> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-@> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-@> :call PhpDocRange()<CR>
let g:pdv_cfg_Type = "int"
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
nnoremap <silent> <space>ur :Unite rails/
nnoremap <silent> <space>rc :Unite rails/controller<CR>
nnoremap <silent> <space>rm :Unite rails/model<CR>
nnoremap <silent> <space>rv :Unite rails/view<CR>
nnoremap <silent> <space>rr :Unite rails/route<CR>
nnoremap <silent> <space>rd :Unite rails/db<CR>
nnoremap <silent> <space>rj :Unite rails/javascript<CR>
nnoremap <silent> <space>rs :Unite rails/stylesheet<CR>
nnoremap <silent> <space>rh :Unite rails/helper<CR>

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

" -----------------------------------------------------------------------------
"  Syntastic
" -----------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['jshint']

" -----------------------------------------------------------------------------
"  OmniSharp
" -----------------------------------------------------------------------------
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>

  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
  autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
  autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
  autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
augroup END

set updatetime=500
set cmdheight=2
