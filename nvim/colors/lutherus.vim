" laurice-nord colours
" Author:  lutherus (Nord adaptation)
" URL:     lutherush.github.io
" Based on: Nord color scheme and original laurice theme

set background=dark
hi clear
if exists("syntax on")
    syntax reset
endif

let g:colors_name="laurice-nord"

" Nord palette reference
" 0: #3b4252 (black)      | 8:  #4c566a (bright black)
" 1: #bf616a (red)        | 9:  #bf616a (bright red)
" 2: #a3be8c (green)      | 10: #a3be8c (bright green)
" 3: #ebcb8b (yellow)     | 11: #ebcb8b (bright yellow)
" 4: #81a1c1 (blue)       | 12: #81a1c1 (bright blue)
" 5: #b48ead (magenta)    | 13: #b48ead (bright magenta)
" 6: #88c0d0 (cyan)       | 14: #8fbcbb (bright cyan)
" 7: #e5e9f0 (white)      | 15: #eceff4 (bright white)

" Core syntax elements
hi Normal          ctermfg=15   ctermbg=NONE
hi Ignore          ctermfg=8
hi Comment         ctermfg=8
hi LineNr          ctermfg=8
hi Float           ctermfg=3
hi Include         ctermfg=5
hi Define          ctermfg=14
hi Macro           ctermfg=5
hi PreProc         ctermfg=5
hi PreCondit       ctermfg=5
hi NonText         ctermfg=8

" File structure and special elements
hi Directory       ctermfg=6
hi SpecialKey      ctermfg=6
hi Type            ctermfg=6
hi String          ctermfg=2
hi Constant        ctermfg=4
hi Special         ctermfg=5
hi SpecialChar     ctermfg=1
hi Number          ctermfg=14
hi Identifier      ctermfg=4

" Control flow and logic
hi Conditional     ctermfg=4
hi Repeat          ctermfg=4
hi Statement       ctermfg=4
hi Label           ctermfg=4
hi Operator        ctermfg=3
hi Keyword         ctermfg=5
hi StorageClass    ctermfg=6
hi Structure       ctermfg=6
hi Typedef         ctermfg=6
hi Function        ctermfg=6
hi Exception       ctermfg=1

" UI elements
hi Underlined      ctermfg=4   cterm=underline
hi Title           ctermfg=3
hi Tag             ctermfg=1
hi Delimiter       ctermfg=7
hi SpecialComment  ctermfg=8
hi Boolean         ctermfg=5
hi Todo            ctermfg=1   ctermbg=NONE  cterm=bold
hi MoreMsg         ctermfg=4   ctermbg=NONE
hi ModeMsg         ctermfg=4   ctermbg=NONE
hi Debug           ctermfg=1   ctermbg=NONE
hi MatchParen      ctermfg=0   ctermbg=6
hi ErrorMsg        ctermfg=1   ctermbg=NONE  cterm=bold
hi WildMenu        ctermfg=15  ctermbg=5
hi Folded          ctermfg=8   ctermbg=0     cterm=bold
hi Search          ctermfg=0   ctermbg=3
hi IncSearch       ctermfg=0   ctermbg=6
hi WarningMsg      ctermfg=3   ctermbg=NONE  cterm=bold
hi Question        ctermfg=2   ctermbg=NONE
hi Pmenu           ctermfg=15  ctermbg=0
hi PmenuSel        ctermfg=15  ctermbg=4
hi Visual          ctermfg=15  ctermbg=4
hi StatusLine      ctermfg=15  ctermbg=0     cterm=bold
hi StatusLineNC    ctermfg=8   ctermbg=0     cterm=NONE
hi VertSplit       ctermfg=0   ctermbg=0
hi CursorLine      ctermbg=0   cterm=NONE
hi CursorLineNr    ctermfg=3   ctermbg=0     cterm=NONE

" Vim script specifics
hi vimCommentTitle ctermfg=8   cterm=bold
hi vimFold         ctermfg=0   ctermbg=15

" Help files
hi helpHyperTextJump ctermfg=4

" JavaScript
hi javaScriptNumber  ctermfg=14

" HTML
hi htmlTag        ctermfg=4
hi htmlEndTag     ctermfg=4
hi htmlTagName    ctermfg=6
hi htmlArg        ctermfg=3

" Perl specifics
hi perlSharpBang  ctermfg=8   term=standout
hi perlStatement  ctermfg=5
hi perlStatementStorage ctermfg=1
hi perlVarPlain   ctermfg=3
hi perlVarPlain2  ctermfg=11

" Ruby specifics
hi rubySharpBang  ctermfg=8   term=standout

" Diff highlighting
hi diffLine       ctermfg=8
hi diffOldLine    ctermfg=8
hi diffOldFile    ctermfg=8
hi diffNewFile    ctermfg=8
hi diffAdded      ctermfg=2
hi diffRemoved    ctermfg=1
hi diffChanged    ctermfg=4

" Spelling
if version >= 700
  hi clear SpellBad
  hi clear SpellCap
  hi clear SpellRare
  hi clear SpellLocal
  hi SpellBad    cterm=underline ctermfg=1
  hi SpellCap    cterm=underline ctermfg=4
  hi SpellRare   cterm=underline ctermfg=5
  hi SpellLocal  cterm=underline ctermfg=6
endif

" vim: foldmethod=marker foldmarker={{{,}}}:
