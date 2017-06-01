﻿ "-------------------------------------------------------------------------------
 " コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
 " map/noremap           @            -              -                  @
 " nmap/nnoremap         @            -              -                  -
 " imap/inoremap         -            @              -                  -
 " cmap/cnoremap         -            -              @                  -
 " vmap/vnoremap         -            -              -                  @
 " map!/noremap!         -            @              @                  -
 "---------------------------------------------------------------------------
" カーソル移動.インサートモード
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" シフトで多めに移動
noremap J 20j
noremap K 20k
noremap L 10l
noremap H 10h

" 無効化
map <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
"nnoremap ZZ <Nop>
"nnoremap ZQ <Nop>
"nnoremap Q <Nop>

" {{{ http://tamata78.hatenablog.com/entry/2015/10/15/214921
" ウィンドウ分割を楽にする設定
nnoremap s <Nop>
nnoremap ss :<C-u>split<CR> " 水平分割
nnoremap sv :<C-u>vsplit<CR> " 垂直分割
nnoremap sq :<C-u>q<CR> " ウィンドウを閉じる
nnoremap sQ :<C-u>bd<CR> " バッファを閉じる
nnoremap sj <C-w>j " 左に移動
noremap <A-Left> <C-w>h 
nnoremap sk <C-w>k " 下に移動
noremap <A-Down> <C-w>j
nnoremap sl <C-w>l " 上に移動
noremap <A-Up> <C-w>k
nnoremap sh <C-w>h " 右に移動
noremap <A-Right> <C-w>l
nnoremap sJ <C-w>J " 画面自体を左に移動
nnoremap sK <C-w>K " 画面自体を下に移動
nnoremap sL <C-w>L " 画面自体を上に移動
nnoremap sH <C-w>H " 画面自体を右に移動
nnoremap s> <C-w>> " 幅を増やす
nnoremap s< <C-w>< " 幅を減らす
nnoremap s+ <C-w>+ " 高さを増やす
nnoremap s- <C-w>- " 高さを減らす


"}}}

"タブ操作
nnoremap t <Nop>
nnoremap <silent> tt :<C-u>tabnew<CR>
nnoremap <silent> tn :<C-u>tabprev<CR>
nnoremap <silent> tx :<C-u>tabclose<CR>
nnoremap <silent> td :<C-u>tabclose<CR>
nnoremap <silent> to :<C-u>tabonly<CR>
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <S-tab> gt
nnoremap <tab><tab> gT

" <Esc><Esc>: ハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

" jj: エスケープ
imap jj <Esc>

" <Y>: 行末までヤンク
nnoremap Y y$

" + と - で数字を変化させる?
nnoremap + <C-a>
nnoremap - <C-x>

" <S-Insert>でクリップボード貼りつけ
noremap <silent> <S-Insert> "*p
inoremap<silent> <S-Insert> <C-R>*
cnoremap <S-Insert> <C-r>*

" QuickRun
noremap <silent> <F5> :QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix<CR>
noremap!<silent> <F5> <Esc>:QuickRun -outputter error -outputter/error/success buffer -outputter/error quickfix<CR>

" Denite
nmap <C-e> :<C-u>Denite directory_rec 
nmap <silent> <C-f> :<C-u>Denite file_rec<CR>
nmap <silent> <F3>  :<C-u>Denite line<CR>
nmap <silent> <C-F3> :<C-u>Denite grep<CR>
nmap <silent> <S-F3>:<C-u>DeniteCursorWord grep<CR>
nmap <silent> <C-h> :<C-u>Denite file_mru<CR>
nmap <silent> <C-y> :<C-u>Denite neoyank<CR>
nmap <silent> <F1>  :<C-u>Denite help<CR>
nmap <silent> <F8>  :<C-u>Denite -resume<CR>
nmap <silent> <F9>  :<C-N>Denite -resume -immediately -select=+1<CR>
nmap <silent> <F10> :<C-P>Denite -resume -immediately -select=-1<CR>

" Unite
noremap <silent> <F11> <ESC>:UniteBookmarkAdd<CR>
noremap <silent> <F12> <ESC>:Unite bookmark -buffer-name=bookmark -vertical -winwidth=50<CR>
noremap! <silent> <F11> <ESC>:UniteBookmarkAdd<CR>
noremap! <silent> <F12> <ESC>:Unite bookmark -buffer-name=bookmark -vertical -winwidth=50<CR>
cnoremap <F11> UniteBookmarkAdd<CR>
cnoremap <F12> Unite bookmark -buffer-name=bookmark -vertical -winwidth=50<CR>
noremap <C-F12> <ESC>:Unite -buffer-name=outline -vertical -winwidth=50 outline<CR>
noremap! <C-F12> <ESC>:Unite -buffer-name=outline -vertical -winwidth=50 outline<CR>

" search
"nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-resize line<CR>

vnoremap <silent> > >gv
vnoremap <silent> < <gv

vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv