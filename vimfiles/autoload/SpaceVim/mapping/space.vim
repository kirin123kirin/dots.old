scriptencoding utf-8

function! SpaceVim#mapping#space#init() abort
  if s:has_map_to_spc()
    return
  endif
  nnoremap <silent><nowait> [SPC] :<c-u>LeaderGuide " "<CR>
  vnoremap <silent><nowait> [SPC] :<c-u>LeaderGuideVisual " "<CR>
  nmap <Space> [SPC]
  vmap <Space> [SPC]
  let g:_spacevim_mappings_space = {}
  let g:_spacevim_mappings_prefixs['[SPC]'] = {'name' : '+SPC prefix'}
  let g:_spacevim_mappings_space['?'] = ['Unite menu:CustomKeyMaps -input=[SPC]', 'キーマップメニューを見る']
  let g:_spacevim_mappings_space.t = {'name' : '+各種設定トグル'}
  let g:_spacevim_mappings_space.t.h = {'name' : '+ハイライト設定'}
  let g:_spacevim_mappings_space.t.m = {'name' : '+モード行設定'}
  let g:_spacevim_mappings_space.T = {'name' : '+UIテーマ'}
  let g:_spacevim_mappings_space.a = {'name' : '+VIMアプリ'}
  let g:_spacevim_mappings_space.b = {'name' : '+バッファ'}
  let g:_spacevim_mappings_space.c = {'name' : '+コメント'}
  let g:_spacevim_mappings_space.f = {'name' : '+ファイル操作'}
  let g:_spacevim_mappings_space.j = {'name' : '+移動系/Join/Split'}
  let g:_spacevim_mappings_space.w = {'name' : '+ウィンドウ系'}
  let g:_spacevim_mappings_space.p = {'name' : '+プロジェクト'}
  let g:_spacevim_mappings_space.h = {'name' : '+ヘルプ'}
  let g:_spacevim_mappings_space.l = {'name' : '+言語仕様'}
  let g:_spacevim_mappings_space.s = {'name' : '+検索系'}
  let g:_spacevim_mappings_space.r = {'name' : '+クリップボード/再開系'}
  " Windows
  for i in range(1, 9)
    exe "call SpaceVim#mapping#space#def('nnoremap', [" . i . "], 'call SpaceVim#layers#core#statusline#jump(" . i . ")', '画面 " . i . " へフォーカス', 1)"
  endfor
  let g:_spacevim_mappings_space.w['<Tab>'] = ['wincmd w', 'alternate-window']
  nnoremap <silent> [SPC]w<tab> :wincmd w<cr>
  call SpaceVim#mapping#menu('alternate-window', '[SPC]w<Tab>', 'wincmd w')
  call SpaceVim#mapping#space#def('nnoremap', ['w', '+'], 
        \ 'call call('
        \ . string(function('s:windows_layout_toggle'))
        \ . ', [])', 'windows-layout-toggle', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'c'], 'Goyo', 'centered-buffer-mode', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'C'], 'ChooseWin | Goyo', 'centered-buffer-mode(other windows)', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'd'], 'close', '画面を閉じる', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'D'], 'ChooseWin | close | wincmd w', '閉じる画面を選択', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'F'], 'tabnew', '新規タブを作成', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'h'], 'wincmd h', '左画面フォーカス', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'j'], 'wincmd j', '下画面フォーカス', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'k'], 'wincmd k', '上画面フォーカス', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'l'], 'wincmd l', '右画面フォーカス', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'H'], 'wincmd H', '選択画面を左へ移動', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'J'], 'wincmd J', '選択画面を下へ移動', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'K'], 'wincmd K', '選択画面を上へ移動', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'L'], 'wincmd L', '選択画面を右へ移動', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'm'], 'only', '画面を最大化', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'M'], 'ChooseWinSwap', '画面を入れ替える', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'o'], 'tabnext', '別のタブへ', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', '/'], 'bel vs | wincmd w', '右画面で開く', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'v'], 'bel vs | wincmd w', '右画面で開く', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', '-'], 'bel split | wincmd w', '下画面で開く', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', '2'], 'silent only | vs | wincmd w', '2分割レイアウト', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', '3'], 'silent only | vs | vs | wincmd H', '3分割レイアウト', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'V'], 'bel vs', '右の画面にフォーカス移動', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', '='], 'wincmd =', '画面幅の自動調整', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'w'], 'wincmd w', '次の画面へ', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'W'], 'ChooseWin', '画面選択', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'u'], 'call SpaceVim#plugins#windowsmanager#UndoQuitWin()', '画面操作undo', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'U'], 'call SpaceVim#plugins#windowsmanager#RedoQuitWin()', '画面操作redo', 1)
  nnoremap <silent> [SPC]bn :bnext<CR>
  let g:_spacevim_mappings_space.b.n = ['bnext', '次のバッファ']
  call SpaceVim#mapping#menu('次のバッファを開く', '[SPC]bn', 'bp')
  nnoremap <silent> [SPC]bp :bp<CR>
  let g:_spacevim_mappings_space.b.p = ['bp', '前のバッファ']
  call SpaceVim#mapping#menu('前のバッファを開く', '[SPC]bp', 'bp')

  "
  " Comments sections
  "
  " Toggles the comment state of the selected line(s). If the topmost selected
  " line is commented, all selected lines are uncommented and vice versa.
  call SpaceVim#mapping#space#def('nnoremap', ['c', 'l'], 'call NERDComment("n", "Toggle")', 'コメントインアウトトグル', 1)

  let g:_spacevim_mappings_space.e = {'name' : '+エラー/エンコード'}
  let g:_spacevim_mappings_space.B = {'name' : '+グローバルバッファ'}
  if g:spacevim_relativenumber
    nnoremap <silent> [SPC]tn  :<C-u>setlocal nonumber! norelativenumber!<CR>
    let g:_spacevim_mappings_space.t.n = ['setlocal nonumber! norelativenumber!', '行番号の表示非表示']
    call SpaceVim#mapping#menu('toggle line number', '[SPC]tn', 'set nu!')
  else
    nnoremap <silent> [SPC]tn  :<C-u>setlocal number!<CR>
    let g:_spacevim_mappings_space.t.n = ['setlocal number!', '行番号の表示非表示']
    call SpaceVim#mapping#menu('toggle line number', '[SPC]tn', 'setlocal number!')
  endif
  call SpaceVim#mapping#space#def('nnoremap', ['b', 'b'], 'Unite buffer', 'バッファ一覧', 1)
  call extend(g:_spacevim_mappings_prefixs['[SPC]'], get(g:, '_spacevim_mappings_space', {}))
  call SpaceVim#mapping#space#def('nnoremap', ['r', 'l'], 'Unite resume', '開いているUniteを再開', 1)

  " Searching in current buffer
  call SpaceVim#mapping#space#def('nnoremap', ['s', 's'], 'Unite line', '現在のバッファでgrep検索', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'S'], "execute 'Unite grep:%::' . expand(\"<cword>\") . '  -start-insert'",
        \ 'grep cursor word in current buffer', 1)
  " Searching in all loaded buffers
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'b'], 'Unite grep:$buffers', 'grep in all loaded buffers', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'B'], "execute 'Unite grep:$buffers::' . expand(\"<cword>\") . '  -start-insert'",
        \ 'grep cursor word in all loaded buffers', 1)
  " Searching in files in an arbitrary directory
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'f'], 'Unite grep', 'grep in arbitrary directory', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'F'], "execute 'Unite grep:::' . expand(\"<cword>\") . '  -start-insert'",
        \ 'grep in arbitrary directory', 1)
  " Searching in project
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'p'], 'Unite grep:.', 'grep in project', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'P'], "execute 'Unite grep:.::' . expand(\"<cword>\") . '  -start-insert'",
        \ 'grep in project', 1)
  " Searching background
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'j'],
        \ 'call SpaceVim#plugins#searcher#find("", SpaceVim#mapping#search#default_tool())', 'Background search keywords in project', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'J'],
        \ 'call SpaceVim#plugins#searcher#find(expand("<cword>"),SpaceVim#mapping#search#default_tool())',
        \ 'Background search cursor words in project', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'l'], 'call SpaceVim#plugins#searcher#list()', 'List all searching results', 1)

  " Searching tools
  " ag
  let g:_spacevim_mappings_space.s.a = {'name' : '+ag'}
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'b'], 'call SpaceVim#mapping#search#grep("a", "b")', '全バッファ内でgrep検索 with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'B'], 'call SpaceVim#mapping#search#grep("a", "B")',
        \ 'search cursor word in all buffers with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'p'], 'call SpaceVim#mapping#search#grep("a", "p")', 'プロジェクト内でgrep検索 with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'P'], 'call SpaceVim#mapping#search#grep("a", "P")',
        \ 'search cursor word in project with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'f'], 'call SpaceVim#mapping#search#grep("a", "f")',
        \ 'search in arbitrary directory  with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'F'], 'call SpaceVim#mapping#search#grep("a", "F")',
        \ 'search cursor word in arbitrary directory  with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'j'], 'call SpaceVim#plugins#searcher#find("", "ag")',
        \ 'Background search cursor words in project with ag', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'a', 'J'], 'call SpaceVim#plugins#searcher#find(expand("<cword>"), "ag")',
        \ 'Background search cursor words in project with ag', 1)
  " grep
  let g:_spacevim_mappings_space.s.g = {'name' : '+grep'}
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'b'], 'call SpaceVim#mapping#search#grep("g", "b")',
        \ 'search in all buffers with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'B'], 'call SpaceVim#mapping#search#grep("g", "B")',
        \ 'search cursor word in all buffers with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'p'], 'call SpaceVim#mapping#search#grep("g", "p")', 'search in project with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'P'], 'call SpaceVim#mapping#search#grep("g", "P")',
        \ 'search cursor word in project with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'f'], 'call SpaceVim#mapping#search#grep("g", "f")',
        \ 'search in arbitrary directory  with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'F'], 'call SpaceVim#mapping#search#grep("g", "F")',
        \ 'search cursor word in arbitrary directory  with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'j'], 'call SpaceVim#plugins#searcher#find("", "grep")',
        \ 'Background search cursor words in project with grep', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'J'], 'call SpaceVim#plugins#searcher#find(expand("<cword>"), "grep")',
        \ 'Background search cursor words in project with grep', 1)
  " ack
  let g:_spacevim_mappings_space.s.k = {'name' : '+ack'}
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'b'], 'call SpaceVim#mapping#search#grep("k", "b")', 'search in all buffers with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'B'], 'call SpaceVim#mapping#search#grep("k", "B")',
        \ 'search cursor word in all buffers with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'p'], 'call SpaceVim#mapping#search#grep("k", "p")', 'search in project with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'P'], 'call SpaceVim#mapping#search#grep("k", "P")',
        \ 'search cursor word in project with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'f'], 'call SpaceVim#mapping#search#grep("k", "f")',
        \ 'search in arbitrary directory  with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'F'], 'call SpaceVim#mapping#search#grep("k", "F")',
        \ 'search cursor word in arbitrary directory  with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'j'], 'call SpaceVim#plugins#searcher#find("", "ack")',
        \ 'Background search cursor words in project with ack', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'k', 'J'], 'call SpaceVim#plugins#searcher#find(expand("<cword>"), "ack")',
        \ 'Background search cursor words in project with ack', 1)
  " rg
  let g:_spacevim_mappings_space.s.r = {'name' : '+rg'}
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'b'], 'call SpaceVim#mapping#search#grep("r", "b")', 'search in all buffers with rt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'B'], 'call SpaceVim#mapping#search#grep("r", "B")',
        \ 'search cursor word in all buffers with rt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'p'], 'call SpaceVim#mapping#search#grep("r", "p")', 'search in project with rt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'P'], 'call SpaceVim#mapping#search#grep("r", "P")',
        \ 'search cursor word in project with rt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'f'], 'call SpaceVim#mapping#search#grep("r", "f")',
        \ 'search in arbitrary directory  with rt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'F'], 'call SpaceVim#mapping#search#grep("r", "F")',
        \ 'search cursor word in arbitrary directory  with rt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'j'], 'call SpaceVim#plugins#searcher#find("", "rg")',
        \ 'Background search cursor words in project with rg', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 'r', 'J'], 'call SpaceVim#plugins#searcher#find(expand("<cword>"), "rg")',
        \ 'Background search cursor words in project with rg', 1)
  " pt
  let g:_spacevim_mappings_space.s.t = {'name' : '+pt'}
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'b'], 'call SpaceVim#mapping#search#grep("t", "b")', '全バッファ内をgrep検索 with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'B'], 'call SpaceVim#mapping#search#grep("t", "B")',
        \ 'search cursor word in all buffers with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'p'], 'call SpaceVim#mapping#search#grep("t", "p")', 'search in project with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'P'], 'call SpaceVim#mapping#search#grep("t", "P")',
        \ 'search cursor word in project with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'f'], 'call SpaceVim#mapping#search#grep("t", "f")',
        \ 'search in arbitrary directory  with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'F'], 'call SpaceVim#mapping#search#grep("t", "F")',
        \ 'search cursor word in arbitrary directory  with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'j'], 'call SpaceVim#plugins#searcher#find("", "pt")',
        \ 'Background search cursor words in project with pt', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['s', 't', 'J'], 'call SpaceVim#plugins#searcher#find(expand("<cword>"), "pt")',
        \ 'Background search cursor words in project with pt', 1)

  call SpaceVim#mapping#space#def('nnoremap', ['s', 'g', 'G'], 'call SpaceVim#plugins#flygrep#open()',
        \ 'grep on the fly', 1)

  call SpaceVim#mapping#space#def('nnoremap', ['s', 'c'], 'noh',
        \ 'clear search highlight', 1)
endfunction

function! SpaceVim#mapping#space#def(m, keys, cmd, desc, is_cmd) abort
  if s:has_map_to_spc()
    return
  endif
  if a:is_cmd
    let cmd = ':<C-u>' . a:cmd . '<CR>' 
    let lcmd = a:cmd
  else
    let cmd = a:cmd
    let feedkey_m = a:m =~# 'nore' ? 'n' : 'm'
    if a:cmd =~? '^<plug>'
      let lcmd = 'call feedkeys("\' . a:cmd . '", "' . feedkey_m . '")'
    else
      let lcmd = 'call feedkeys("' . a:cmd . '", "' . feedkey_m . '")'
    endif
  endif
  exe a:m . ' <silent> [SPC]' . join(a:keys, '') . ' ' . substitute(cmd, '|', '\\|', 'g')
  if len(a:keys) == 2
    let g:_spacevim_mappings_space[a:keys[0]][a:keys[1]] = [lcmd, a:desc]
  elseif len(a:keys) == 3
    let g:_spacevim_mappings_space[a:keys[0]][a:keys[1]][a:keys[2]] = [lcmd, a:desc]
  elseif len(a:keys) == 1
    let g:_spacevim_mappings_space[a:keys[0]] = [lcmd, a:desc]
  endif
  call SpaceVim#mapping#menu(a:desc, '[SPC]' . join(a:keys, ''), lcmd)
  call extend(g:_spacevim_mappings_prefixs['[SPC]'], get(g:, '_spacevim_mappings_space', {}))
endfunction

function! s:has_map_to_spc() abort
  return get(g:, 'mapleader', '\') ==# ' '
endfunction

function! s:windows_layout_toggle() abort
  if winnr('$') != 2
    echohl WarningMsg
    echom "2画面無いため画面トグルできません(Can't toggle window layout when the number of windows isn't two.)"
    echohl None
  else 
    if winnr() == 1
      let b = winbufnr(2)
    else
      let b = winbufnr(1)
    endif
    if winwidth(1) == &columns
      only
      vsplit
    else
      only
      split
    endif
    exe 'b'.b
    wincmd w
  endif
endfunction
function! SpaceVim#mapping#space#langSPC(m, keys, cmd, desc, is_cmd) abort
  if s:has_map_to_spc()
    return
  endif
  if a:is_cmd
    let cmd = ':<C-u>' . a:cmd . '<CR>' 
    let lcmd = a:cmd
  else
    let cmd = a:cmd
    let feedkey_m = a:m =~# 'nore' ? 'n' : 'm'
    if a:cmd =~? '^<plug>'
      let lcmd = 'call feedkeys("\' . a:cmd . '", "' . feedkey_m . '")'
    else
      let lcmd = 'call feedkeys("' . a:cmd . '", "' . feedkey_m . '")'
    endif
  endif
  exe a:m . ' <silent> <buffer> [SPC]' . join(a:keys, '') . ' ' . substitute(cmd, '|', '\\|', 'g')
  if len(a:keys) == 2
    let g:_spacevim_mappings_space[a:keys[0]][a:keys[1]] = [lcmd, a:desc]
  elseif len(a:keys) == 3
    let g:_spacevim_mappings_space[a:keys[0]][a:keys[1]][a:keys[2]] = [lcmd, a:desc]
  elseif len(a:keys) == 1
    let g:_spacevim_mappings_space[a:keys[0]] = [lcmd, a:desc]
  endif
  call SpaceVim#mapping#menu(a:desc, '[SPC]' . join(a:keys, ''), lcmd)
  call extend(g:_spacevim_mappings_prefixs['[SPC]'], get(g:, '_spacevim_mappings_space', {}))
endfunction

" vim:set et sw=2 cc=80: