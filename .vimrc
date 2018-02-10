"===========================================================
" Plugins (dein)
"===========================================================
set shellslash   " Windowsで"/"を有効
set nocompatible " vi互換なし

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  
 " -- Plugins --------------------------------------------
  call dein#add('Shougo/vimshell')            " インタラクティブなシェルコンソール
  call dein#add('Shougo/unite.vim')           " 統合インタフェース
  call dein#add('Shougo/neomru.vim')          " 上記の補助
  call dein#add('Shougo/neocomplete.vim')     " オートコンプリート (complcacheの次世代版)
  call dein#add('Shougo/neosnippet')          " スニペットの利用
  call dein#add('Shougo/neosnippet-snippets') " スニペットの自作
  call dein#add('mattn/emmet-vim')            " HTML記述支援
  call dein#add('Shougo/vimproc', {'build' : 'make'}) " 非同期処理
 
 " -------------------------------------------------------
  
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  echo 'Install Needed'
  :silent! call dein#install()
endif


"==================================
" Vim Setting File
"==================================

"---------------------------------
" Encode Settings
"---------------------------------
set encoding=utf-8 " ファイル読取時のエンコーディング
set fileencoding=utf-8 " ファイル書込時のエンコーディング
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
scriptencoding utf-8 " マルチバイト文字の利用時の設定(日本語を使う際に必要)

"---------------------------------
" System Settings
"---------------------------------

"" ファイル入出力補助
set autoread " 外部でファイルに変更がされた場合は読みなおす
set confirm " 保存されていないファイルがあるとき、終了前に保存確認
set hidden " 保存されていないファイルがあるときでも、保存しないで他のファイルを表示
" set nobackup " backupファイルを作らない, nobackupの場合は、上書きに成功したら削除される
" set backupdir=./backup " backupファイルディレクトリ
" set writebackup " ファイルの上書きの前にbackupファイルを作る
" set noswapfile " swapファイルを作らない
" set directory=./swap " swapファイルディレクトリ

"" コマンド補助
set history=100 " コマンド、検索履歴数
set wildmenu  " ファイル名補完有効
set wildmode=list:longest,full " 補完モード
set infercase " 補完の際の大文字小文字の区別しない

"" エラー
set noerrorbells " エラー音抑止
" set novisualbell " ビジュアルベル抑止

"---------------------------------
" Display Settings
"---------------------------------
set cmdheight=2 " コマンドラインの高さ
set number " 行番号の表示
set ruler  " 右下に行・列の番号を表示
set showcmd " 入力中のコマンドをステータスラインに表示
set laststatus=2 " 常にステータスラインを表示
set title  " タイトル表示
set nowrap " 折り返さない
set list   " 不可視文字を表示
" set listchars=tab:>>-,eol:$,extends:>>,precedes:<< " 不可視文字の置き換え設定
set display=uhex  " 表示できない文字を16進数で表示

syntax on " シンタックスハイライト
set cursorline " カーソル行をハイライト
set cursorcolumn " カーソル位置のカラムのハイライト
set showmatch " 括弧の対応表示

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"---------------------------------
" Search/Replace
"---------------------------------
" nmap <Esc><Esc> :nohlsearch<CR><Esc> "set key: highlight off
set ignorecase " 大/小文字無視
set smartcase " ただし大文字を含む検索の場合は大/小文字有効
set incsearch " インクリメンタルサーチ有効
set hlsearch " 検索結果ハイライト表示
set wrapscan " 検索をファイルの先頭へループする
" set gdefault " 置換の時 g オプションをデフォルトで有効


"---------------------------------
" Indent and Tab
"---------------------------------
set tabstop=2 " タブ幅
set softtabstop=2 " タブ幅（編集時）
set shiftwidth=2 " インデント幅
set autoindent " 前行に合わせてインデント
set smartindent " 前行の末尾に合わせてインデントを増減
set expandtab " タブの代わりにスペース

"---------------------------------
" Cursor
"---------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set backspace=indent,eol,start " バックスペースキーの有効化

"===========================================================
" Snippet
"===========================================================
let g:neosnippet#snippets_directory=expand('~/.vim/mysnippets')

"===========================================================
" Emmet
"===========================================================
