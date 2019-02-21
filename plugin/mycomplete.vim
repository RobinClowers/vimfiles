"let g:rubycomplete_buffer_loading = 1
set complete-=i

let g:localcomplete#OriginNoteLocalcomplete = '%'
let g:localcomplete#OriginNoteAllBuffers = '+'
let g:localcomplete#OriginNoteDictionary = '*'
let g:localcomplete#LocalMinPrefixLength = 0
let g:localcomplete#AllBuffersMinPrefixLength = 0

" Add $ and - as keyword chars in sass/css/haml as necessary
" $ doesn't work w/ localcomplete
autocmd BufRead,BufNewFile *.{sass,scss} setlocal iskeyword+=$
autocmd BufRead,BufNewFile *.{css,sass,scss,less,styl,haml,html,erb} setlocal iskeyword+=- 
  \| let b:LocalCompleteAdditionalKeywordChars = '-'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'
let g:deoplete#force_overwrite_completefunc = 1
let g:deoplete#enable_fuzzy_completion = 1
let g:deoplete#enable_auto_delimiter = 0
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 3
" It gets 100ms, then we skip it
let g:deoplete#skip_auto_completion_time = 0.1

" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return deoplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? deoplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  deoplete#close_popup()
inoremap <expr><C-e>  deoplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType typescript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

call deoplete#custom#source('tag',
  \ 'disabled_filetypes', {'_' : 1})
call deoplete#custom#source('omni', 'rank', 14)
call deoplete#custom#source('omni', 'max_candidates', 20)
call deoplete#custom#source('vim', 'rank', 15)
call deoplete#custom#source('vim', 'max_candidates', 20)

" Enable heavy omni completion.
if !exists('g:deoplete#sources#omni#input_patterns')
  let g:deoplete#sources#omni#input_patterns = {}
endif
let g:deoplete#sources#omni#input_patterns.css = '^\s\+\k\+\|\w\+[):;]\?\s\+\k*\|[@!]'
let g:deoplete#sources#omni#input_patterns.clojure = '[[:alnum:]_-]\+'
"let g:deoplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:deoplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:deoplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
