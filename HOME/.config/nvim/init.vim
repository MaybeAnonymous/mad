set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Modules
source ~/.config/nvim/user-modules/start-up.vim
source ~/.config/nvim/user-modules/plugs.vim
source ~/.config/nvim/user-modules/neovide.vim


" Open new split panes to right and below
set splitright
set splitbelow


" Insert Keybindings
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi

inoremap <silent> <A-z> <Esc>:undo<CR>==gi
inoremap <silent> <A-y> <Esc>:redo<CR>==gi

inoremap <silent> <Leader>p

" Normal Keybindings
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-Q> :bd<CR>
nnoremap <silent> <esc> :noh<cr><esc>

" Other
autocmd FileType json syntax match Comment +\/\/.\+$+


" WinMove
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
