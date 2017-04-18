" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tab & Shift-Tab go forward and backward in the opened buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" bind ^s to save
nnoremap <silent> <C-S> :write<CR>
