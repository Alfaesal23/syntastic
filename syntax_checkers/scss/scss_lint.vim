"============================================================================
"File:        scss_lint.vim
"Description: SCSS style and syntax checker plugin for Syntastic
"Maintainer:  Shane da Silva <shane@dasilva.io>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================
"
" Since scss-lint also checks your SCSS file syntax, you can replace the Sass
" syntax checker using:
"
" let g:syntastic_scss_checkers = ['scss_lint']

if exists("g:loaded_syntastic_scss_scss_lint_checker")
    finish
endif
let g:loaded_syntastic_scss_scss_lint_checker=1

function! SyntaxCheckers_scss_scss_lint_IsAvailable()
    return executable('scss-lint')
endfunction

function! SyntaxCheckers_scss_scss_lint_GetLocList()
    let makeprg = syntastic#makeprg#build({
        \ 'exe': 'scss-lint',
        \ 'filetype': 'scss',
        \ 'subchecker': 'scss_lint' })

    let errorformat = '%f:%l\ [%t]\ %m'

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style'})

    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'scss',
    \ 'name': 'scss_lint'})
