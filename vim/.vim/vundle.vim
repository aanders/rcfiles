" Vundle plugin manager setup
"
" see https://github.com/VundleVim/Vundle.vim

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" === Vundle ===
"
" Vim plugin manager

Plugin 'VundleVim/Vundle.vim'

" === CtrlP ===
"
" Fuzzy file finder

Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_by_filename = 1            " search by filename by default
let g:ctrlp_cmd = 'CtrlPMRU'           " open most recently used pane by default
let g:ctrlp_working_path_mode = 'wr'   " search from CWD of containing process
" let g:ctrlp_tabpage_position = 'al'  " open new tabs after the last tab page
let g:ctrlp_arg_map = 1                " choose tab v win when using <c-o>/<c-y>
let g:ctrlp_root_markers = ['.ctrlp.root']
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]?(\.git|CMakeFiles|bin)$',
\ 'file': '\v\.(exe|so|dll)$',
\ }

" === lightline ===
"
" Status line plugin

Plugin 'itchyny/lightline.vim'

" - Add relative path for active buffer
" - Add smoother integration with CtrlP
let g:lightline = {
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'readonly', 'filename', 'ctrlpmark' ],
\               [ 'filepath' ] ]
\   },
\   'component_function': {
\     'filename': 'LightlineFilename',
\     'filepath': 'LightlineFilepath',
\     'ctrlpmark': 'CtrlPMark',
\   },
\   'enable': {
\     'statusline': 1,
\     'tabline': 1,
\   },
\   'colorscheme': 'PaperColor',
\ }

" Tell CtrlP to get its status lines from our custom functions
"
" The CtrlP integration is heavily based on the lightline author's suggested
" settings in https://github.com/itchyny/lightline.vim/issues/16
let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

" Add '+' to filename when buffer is modified
function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

" Display relative file path (or CtrlP working directory)
function! LightlineFilepath()
    if expand('%:t') =~ 'ControlP'
        return '[' . getcwd() . ']'
    else
        return expand('%:h') != '.' ? expand('%:h') : ''
    endif
endfunction

" Display CtrlP statusline info (e.g. mru/files/buffers etc) or progress msg
hi User1 term=bold cterm=bold ctermfg=black ctermbg=white
function! CtrlPMark()
    if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        if g:lightline.ctrlp_prog
            return 'Processing... ' . g:lightline.ctrlp_prog
        else
            " return lightline#concatenate([g:lightline.ctrlp_prev,
            "         \ g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
            return g:lightline.ctrlp_item
        endif
    else
        return ''
    endif
endfunction

" CtrlP callback to create its status line using lightline formatting
function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_prog = ''
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

" Second CtrlP callback for use when scanning files/directories
function! CtrlPStatusFunc_2(str)
    let g:lightline.ctrlp_prog = a:str
    return lightline#statusline(0)
endfunction

" lightline no longer has support for reloading colorscheme when toggling the
" 'background' option: see https://github.com/itchyny/lightline.vim/issues/194
" The following is a workaround based on
" https://github.com/itchyny/lightline.vim/issues/424#issuecomment-590058820
" which manually re-sources the appropriate colorscheme file when the
" background option value is set.
function! LightlineReloadColors()
    let colors_path =
        \ 'autoload/lightline/colorscheme/' . g:lightline.colorscheme . '.vim'
    execute 'source' globpath(&rtp, colors_path)
    call lightline#colorscheme()
    call lightline#update()
endfunction
augroup lightline_customizations
    autocmd!
    autocmd OptionSet background call LightlineReloadColors()
augroup END

" lightline renders showmode irrelevant
set noshowmode

" === Fugitive ===
"
" Git integration created by the one and only tpope

Plugin 'tpope/vim-fugitive'

" === Commentary ===
"
" Awesome plugin by tpope for commenting/uncommenting source code

Plugin 'tpope/vim-commentary'

" === Colorschemes ===

Plugin 'NLKNguyen/papercolor-theme'

" === Language plugins ===

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
let g:racer_experimental_completer = 1

" Go
Plugin 'fatih/vim-go'

" TOML
Plugin 'cespare/vim-toml'

" Vala
Plugin 'arrufat/vala.vim'

" Python
Plugin 'vim-python/python-syntax'

call vundle#end()
filetype plugin on
