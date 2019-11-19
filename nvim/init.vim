set expandtab
set nohlsearch
set noshowmode
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set updatetime=300

let mapleader = '\'

autocmd TermOpen * setlocal bufhidden=hide

function! s:SetIndent(val)
  let &shiftwidth = a:val
  let &softtabstop = a:val
  let &tabstop = a:val
endfunction

function! s:ToggleIndent()
  if &shiftwidth != 4
    call s:SetIndent(4)
  else
    call s:SetIndent(2)
  endif
endfunction

command! -nargs=1 Indent call s:SetIndent(<args>)
command! -nargs=0 ToggleIndent call s:ToggleIndent(<args>)

nnoremap <leader>r :call jobstart(['make'])<CR>
nnoremap <leader>i :ToggleIndent<CR>
nnoremap <leader>% :let @+ = @%<CR>
