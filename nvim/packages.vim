" bufferline
let g:bufferline_echo = 0
let g:bufferline_modified = ' ✚'

" vim-airline
let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'hard'

" vim-go
let g:go_fmt_command = "goimports"

" vim-autoswap
let g:autoswap_detect_tmux = 1

" fzf
let g:fzf_layout = { 'down': '~20%' }

" ale
let g:ale_fixers = {
      \'javascript': ['prettier_standard'],
      \'rust': ['rustfmt'],
   \}

let g:ale_linters = {
      \'javascript': [''],
      \'go': ['gopls'],
      \'rust': ['rls'],
   \}
let g:ale_fix_on_save = 1
let g:ale_rust_rls_toolchain = 'stable'
