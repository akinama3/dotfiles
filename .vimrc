" -----------------------------------------------------------------------------
"  初期化
" -----------------------------------------------------------------------------
"  自動コマンド
autocmd!

" vi 互換モードをオフ
if &compatible
  set nocompatible
endif

" -----------------------------------------------------------------------------
"  dein.vim
" -----------------------------------------------------------------------------
filetype plugin indent off

" dein.vim ランタイムパス指定
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" dein.vim 設定
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml(expand('~/.vim/rc') . '/dein.toml',      {'lazy': 0})
  call dein#load_toml(expand('~/.vim/rc') . '/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#load_toml(expand('~/.vim/rc') . '/dein_not_nvim.toml', {'lazy': 0})
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif

if dein#check_install()
  call dein#install()
endif

" ファイルタイプの自動検出
filetype indent plugin on

" -----------------------------------------------------------------------------
"  Syntax
" -----------------------------------------------------------------------------
syntax on
let g:molokai_original=1
colorscheme molokai
highlight Normal ctermbg=none

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
set fileformats=unix,dos,mac

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

" カーソルラインをハイライトする
" set cursorline

" バックスペースでインデント削除
set backspace=indent,eol,start

" 日本語のズレを無くす
set ambiwidth=double

" タブ、空白、改行の可視化
set list
set listchars=tab:>\ ,trail:_

" 折り畳み設定
set foldmethod=syntax

" バッファを開いた時に、カレントディレクトリを自動で移動
" autocmd BufEnter * execute ":lcd " . expand("%:p:h")

" 環境に合わせてsourceするようにする(リポジトリには含めない)
source ~/.vimrc.local

" Escape を jj に設定
inoremap <silent> jj <ESC>

" Quick Fixを下側に表示する
set splitbelow

" -----------------------------------------------------------------------------
"  バッファ操作
" -----------------------------------------------------------------------------
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
 
" -----------------------------------------------------------------------------
"  neosnippet
" -----------------------------------------------------------------------------
let g:neosnippet#enable_completed_snippet = 1

" キーマップの設定
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

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
" deoplete.nvim
" -----------------------------------------------------------------------------
set completeopt+=noinsert
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1 
let g:deoplete_disable_auto_complete=1
call deoplete#custom#buffer_option('auto_complete', v:false)

if !exists('g:deoplete#sources#omni#input_patterns')
  let g:deoplete#sources#omni#input_patterns = {}
endif
let g:deoplete#sources#omni#input_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'
let g:deoplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.cpp = ['LanguageClient']
let g:deoplete#sources.python = ['LanguageClient']
let g:deoplete#sources.python3 = ['LanguageClient']
let g:deoplete#sources.rust = ['LanguageClient']
let g:deoplete#sources.c = ['LanguageClient']
let g:deoplete#sources.vim = ['vim']


" -----------------------------------------------------------------------------
" vim-airline
" -----------------------------------------------------------------------------
" 256色モード(iTerm2+PowerLineの表示には必要)
set t_Co=256

" かっこいいバー
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = "⮃"
let g:airline#extension#branch#symbol = '⭠'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'dark'
let g:airline_section_c = '%F'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0

" -----------------------------------------------------------------------------
"  unite.vim
" -----------------------------------------------------------------------------
" インサートモードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_rec_min_cache_files=10
let g:unite_source_rec_max_cache_files=1000
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
noremap <C-U><C-A> :Unite file_rec/async:.<CR>
" 再帰的にプロジェクトディレクトリを更新
noremap <C-U><C-G> :Unite file_rec/git:.<CR>
" アウトライン
noremap <C-U><C-O> :Unite -vertical -no-quit outline<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

call unite#custom#source(
            \ 'file_rec/async',
            \ 'ignore_pattern',
            \ '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|png\|jpg\|meta\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)\|\<vendor\>\|\<node_modules\>\|\<htdocs\>\|\<tmp\>')

call unite#custom#source(
            \ 'file_rec/git',
            \ 'ignore_pattern',
            \ '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|png\|jpg\|meta\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)\|\<vendor\>\|\<node_modules\>\|\<htdocs\>\|\<tmp\>')

call unite#custom#source(
            \ 'file',
            \ 'ignore_pattern',
            \ '\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|png\|jpg\|meta\|dll\|bak\|sw[po]\|class\)$\|\%(^\|/\)\%(\.hg\|\.git\|\.bzr\|\.svn\|tags\%(-.*\)\?\)\%($\|/\)\|\<vendor\>\|\<node_modules\>\|\<htdocs\>\|\<tmp\>')

" -----------------------------------------------------------------------------
"  vim-ref
" -----------------------------------------------------------------------------
let g:ref_phpmanual_path = $DOTVIM . '/docs/phpmanual'
nnoremap <silent> <space>refp :Unite ref/phpmanual<CR>
nnoremap <silent> <space>refe :Unite ref/refe<CR>
nnoremap <silent> <space>refr :Unite ref/ri<CR>

" Ruby
" let g:ref_use_vimproc=1
" let g:ref_refe_version=2
" let g:ref_refe_encoding='utf-8'

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
if !has('nvim')
  set clipboard=unnamed,autoselect
end

" -----------------------------------------------------------------------------
"  vdebug
" -----------------------------------------------------------------------------
let g:vdebug_options = {
\    "port" : 9000,
\    "break_on_open" : 0,
\    "continuous_mode"  : 1,
\    'server': '0.0.0.0',
\    "path_maps" : {
\        '/vagrant/docroot' : '/Users/katagiri/Vagrant/trusty64/docroot',
\        }
\}

" -----------------------------------------------------------------------------
"  uniteの色
" -----------------------------------------------------------------------------
highlight PmenuSel ctermbg=0 ctermfg=208

" -----------------------------------------------------------------------------
"  MultipleSearch
" -----------------------------------------------------------------------------
nnoremap * :Search <C-R><C-W><CR>
nnoremap + :SearchReset<CR>
let g:MultipleSearchMaxColors = 4

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
"  Syntastic
" -----------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors=['trimming empty', 'missing </a> before <div>', 'discarding unexpected </a>']
let g:syntastic_html_validator_parser = 'html5'

" -----------------------------------------------------------------------------
"  SmartyJump
" -----------------------------------------------------------------------------
nnoremap <silent> <space>i :call SmartyJump()<CR>

" -----------------------------------------------------------------------------
"  NERDTree
" -----------------------------------------------------------------------------
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <space>tt :NERDTreeToggle<CR>
nnoremap <silent> <space>tf :NERDTreeFind<CR>

" -----------------------------------------------------------------------------
"  Git
" -----------------------------------------------------------------------------
noremap <silent> <space>gs :Gstatus<CR>
noremap <silent> <space>gb :Gblame<CR>
noremap <silent> <space>gd :Gvdiff<CR>
noremap <silent> <space>gr :Gremove<CR>
noremap <silent> <space>ggh :GitGutterLineHighlightsToggle<CR>

" -----------------------------------------------------------------------------
"  Align
" -----------------------------------------------------------------------------
nnoremap <silent> <space>a> :Align =><CR>
nnoremap <silent> <space>a= :Align =<CR>

" -----------------------------------------------------------------------------
"  Kwbd
" -----------------------------------------------------------------------------
nnoremap <silent> <space>kw :Kw<CR>

" -----------------------------------------------------------------------------
"  Buffer Only
" -----------------------------------------------------------------------------
nnoremap <silent> <space>bo :Bo<CR>

" -----------------------------------------------------------------------------
"  Omni Sharp
" -----------------------------------------------------------------------------
" https://github.com/OmniSharp/omnisharp-roslyn/release
" omnisharp.http-osx.tar.gz をOmniSharp_server_path をいい感じに指定:
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_path = '/usr/local/Omnisharp/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
augroup omnisharp_commands
    autocmd!

    " ビルド実行する
    autocmd FileType cs nnoremap <space>ob :wa!<cr>:OmniSharpBuildAsync<cr>

    " 新しいファイルをプロジェクトに自動的に追加する
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " カーソルの移動が止まったら型情報を自動的に表示する
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " キーバインド
    noremap <silent> <space>ff :OmniSharpCodeFormat<CR>
    noremap <silent> <space>fe :OmniSharpFindSyntaxErrors<CR>
    noremap <silent> <space>fd :OmniSharpGotoDefinition<CR>
    noremap <silent> <space>fr :OmniSharpFindUsages<CR>
    noremap <silent> <space>ft :OmniSharpFindType<CR>
    noremap <silent> <space>fs :OmniSharpFindSymbol<CR>
    noremap <silent> <space>r :OmniSharpReloadSolution<CR>
augroup END

" -----------------------------------------------------------------------------
"  Git Gutter
" -----------------------------------------------------------------------------
nnoremap <silent> vgg :GitGutterAll<CR>
