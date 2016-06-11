execute pathogen#infect('bundle/{}',)
"basic setup
syntax on
filetype plugin indent on
"FOR ECLIM
if has("autocmd")
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif 
setlocal completefunc=javacomplete#CompleteParamsInfo 

"settings for vim notes.
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'

"settings to move text left and right
nmap <C-l> :> <CR>
nmap <C-h> :< <CR>

let g:airline_powerline_fonts = 1
let g:airline_theme="solarized"
"let g:airline#extensions#tabline#enabled = 1
"font for the gui
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13
"statusline
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline+=%{fugitive#statusline()} "for git status
"gundo settings
nnoremap <F5> :GundoToggle<CR>
"theme for vim
syntax enable
set background=dark
colorscheme solarized 
let g:molokai_original = 1
set cursorline
set relativenumber
set number
set mouse=a

"nedrtree navigator
map <C-z> :NERDTreeToggle<CR>
imap jj <Esc>
nmap <C-x> :TagbarToggle<CR>
"custom mappings
nmap <C-a> :write<CR>

"java script completion
let g:js_fmt_fail_silently = 1
let g:js_fmt_autosave = 1
let g:js_fmt_command = "jsfmt"

"settings for phpfmt
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
let g:phpfmt_php_path = "php"               " Path to PHP
let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)

"vim-go plugin settings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave =1 
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"You Complete Me settings
autocmd CompleteDone * pclose

"settings to autoformat cpp
let g:formatterpath =['/usr/local/bin/clang-format']
autocmd BufWritePre *.cpp :Autoformat

"settings for emmet-vim
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
autocmd FileType html,css EmmetInstall
