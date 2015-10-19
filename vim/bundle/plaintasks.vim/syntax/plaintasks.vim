" Vim syntax file
" Language: PlainTasks
" Maintainer: David Elentok
" Filenames: *.TODO

if exists("b:current_syntax")
  finish
endif

hi def link ptTask Normal
hi def link ptCompleteTask Comment
hi def link ptCanceledTask Comment
hi def link ptSection PreProc
hi def link ptContext Question
hi def link ptLine Function

syn match ptSection "^.*: *$"
syn match ptTask "^ *-.*" contains=ptContext
syn match ptCompleteTask "^ *+.*" contains=ptContext
syn match ptContext "@[^ ]*"
syn match ptLine "^----*"
syn match ptCanceledTask "^ *x.*" contains=ptCanceledTask



