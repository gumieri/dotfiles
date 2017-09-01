" <Ctrl-p> with fzf
nnoremap <C-p> :FZF<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tab & Shift-Tab go forward and backward in the opened buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" <Ctrl-x> to close the current buffer
nnoremap <silent> <C-x> :bd<CR>

" <Ctrl-s> to save
nnoremap <silent> <C-S> :write<CR>

" <Ctrl-q> to quit
nnoremap <silent> <C-Q> :quit<CR>

nnoremap <silent> <F2> :%y+<CR>
nnoremap <silent> <F4> ggdG"+P<CR>
