set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"
" Modules
"
source ~/.config/nvim/modules/neovide.vim
source ~/.config/nvim/modules/plugs.vim
source ~/.config/nvim/modules/start-up.vim

"
" Other
"
autocmd FileType json syntax match Comment +\/\/.\+$+
set foldlevel=99
set foldmethod=syntax
set splitbelow
set splitright

"
" Keybindings
"  note: ==gi means to go back to insert mode after
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <A-y> <Esc>:redo<CR>==gi
inoremap <silent> <A-z> <Esc>:undo<CR>==gi
nnoremap <silent> <C-Q> :bd<CR>
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-z> za
nnoremap <silent> <esc> :noh<CR><esc>

"
" WinMove
"  note: not sure how this works, got it from some random website
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
