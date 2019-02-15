" Initialize a colors dictionary.
let s:colors = {}

let g:colors_name = "bernhard"

" Color definitions.
let s:colors.black       = ['#000000', 000] 
let s:colors.densegrey   = ['#121212', 233]
let s:colors.deepgrey    = ['#1c1c1c', 234]
let s:colors.darkgrey    = ['#262626', 235]
let s:colors.grey        = ['#949494', 246]
let s:colors.skyblue     = ['#87afff', 68]
let s:colors.navy        = ['#00005f', 21]
let s:colors.apache      = ['#ff5f5f', 203]
let s:colors.white       = ['#ffffff', 231]
let s:colors.orchid      = ['#d75fd7', 170]
let s:colors.pink      = ['#d7005f', 161]

" Highlighting function
" Cribbed from badwolf, guvbox.
function! s:highlight(target, fg, ...)
  " ... = bg, style.
  let histring = 'hi ' . a:target . ' '
  let fcolor = get(s:colors, a:fg)
 
  if strlen(a:fg)
    let histring .= 'guifg=' . fcolor[0] . ' ctermfg=' . fcolor[1] . ' '
  end
  
  if a:0 >= 1 && strlen(a:1)
    let bcolor = get(s:colors, a:1)
    let histring .= 'guibg=' . bcolor[0] . ' ctermbg=' . bcolor[1] . ' '
  endif 
  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  " Check that we actually got arguments.
  if histring != 'hi ' . a:target . ' '
    exe histring
  endif
endfunction

function! s:setLight()
  set background=light
  " Base colors.
  call s:highlight('Normal', 'black', 'white')
  call s:highlight('NonText', 'darkgrey')
  call s:highlight('comment', 'orchid')
  call s:highlight('constant', 'apache', 'white', 'bold')
  call s:highlight('string', 'grey')
  call s:highlight('identifier', 'darkgrey', 'white')
  call s:highlight('statement', 'black', '', 'bold')
  call s:highlight('define', 'darkgrey')
  call s:highlight('preproc', 'orchid')
  call s:highlight('type', 'apache')
  call s:highlight('special', 'black', '', 'bold')
  call s:highlight('Underlined', 'darkgrey')
  call s:highlight('label', 'darkgrey')
  call s:highlight('operator', 'pink')
  call s:highlight('delimiter', 'darkgrey')
  
  " Inline notifications. 
  call s:highlight('Todo', 'orchid', 'white', 'bold')
  call s:highlight('Search', 'white', 'apache')
  call s:highlight('IncSearch', 'white', 'apache')
  call s:highlight('title', 'darkgrey')
 
  " CursorLine
  call s:highlight('Cursor', 'darkgrey')
  call s:highlight('CursorLine', '', '', 'NONE')
  call s:highlight('CursorLineNr', 'apache')

  " Status line
  call s:highlight('StatusLine', 'black', 'white')
  call s:highlight('StatusLineNC', 'white', 'black')
  
  " Windows
  call s:highlight('VertSplit', 'white')

  " Diff 
  call s:highlight('DiffChange', 'darkgrey')
  call s:highlight('DiffText', 'darkgrey')
  call s:highlight('DiffAdd', 'darkgrey')
  call s:highlight('DiffDelete', 'darkgrey')

  " Folds
  call s:highlight('Folded', 'darkgrey')
  call s:highlight('FoldColumn', 'darkgrey')
  
  " Visual
  call s:highlight('Visual', 'darkgrey')
  
  " Sign Column
  call s:highlight('LineNr', 'black', 'white')
  call s:highlight('SignColumn', 'skyblue', 'white')

  " Command window
  call s:highlight('ErrorMsg', 'apache')
  call s:highlight('WarningMsg', 'apache')
  call s:highlight('ModeMsg', 'deepgrey')
  call s:highlight('MoreMsg', 'darkgrey')
  call s:highlight('Error', 'apache')

  " Spelling
  call s:highlight('SpellLocal', '', 'white', 'italic')
  call s:highlight('SpellBad', '', 'white', 'underline')
  call s:highlight('SpellCap', '', 'white', 'underline')

  " Markdown
  call s:highlight('markdownLinkText', 'apache', '', 'underline')
  call s:highlight('markdownHeadingDelimiter', 'apache')
  call s:highlight('markdownListMarker', 'apache')
  call s:highlight('markdownCodeDelimiter', 'orchid')
  call s:highlight('markdownH1', 'apache', '', 'bold')
  call s:highlight('markdownH2', 'apache', '', 'bold')
  call s:highlight('markdownH3', 'apache', '', 'bold')
  call s:highlight('markdownH4', 'apache', '', 'bold')
  call s:highlight('markdownH5', 'apache', '', 'bold')
  call s:highlight('markdownH6', 'apache', '', 'bold')

endfunction

" Set base colors.
call s:setLight()
